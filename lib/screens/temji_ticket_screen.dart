import 'package:flutter/material.dart';
import 'bunkasai/tenji/ticket_create_screen.dart';

class TenjiScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tenjiList = [
    {'id': 'tenji1', 'name': '101'},
    {'id': 'tenji2', 'name': '102'},
    {'id': 'tenji3', 'name': '103'},
  ];

  TenjiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('展示一覧'), backgroundColor: Colors.indigo),
      body: ListView.builder(
        itemCount: tenjiList.length,
        itemBuilder: (context, index) {
          final tenji = tenjiList[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(tenji['name']),
              trailing: ElevatedButton.icon(
                icon: const Icon(Icons.confirmation_number_outlined),
                label: const Text('整理券を取る'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TicketCreateScreen(
                        tenjiId: tenji['id'],
                        tenjiName: tenji['name'],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
