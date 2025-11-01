import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(title: const Text('整理券一覧'), backgroundColor: Colors.indigo),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('tickets')
            .where('userId', isEqualTo: userId)
            .where('status', isEqualTo: 'valid')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final tickets = snapshot.data!.docs;
          if (tickets.isEmpty) return const Center(child: Text('現在、整理券はありません'));

          return ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final data = tickets[index].data() as Map<String, dynamic>;
              final ticketId = tickets[index].id;

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.confirmation_number, color: Colors.indigo),
                  title: Text(data['tenjiName'] ?? '展示'),
                  subtitle: Text('発行時刻: ${data['timestamp']?.toDate().toString().substring(0, 16) ?? ""}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    onPressed: () async {
                      final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
                      await FirebaseFirestore.instance.runTransaction((transaction) async {
                        transaction.update(FirebaseFirestore.instance.collection('tickets').doc(ticketId), {'status': 'cancelled'});
                        transaction.update(userRef, {'ticketCount': FieldValue.increment(-1)});
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
