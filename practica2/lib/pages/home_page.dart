import 'package:flutter/material.dart';
import '../services/product_service.dart';
import 'product_list_page.dart';

class HomePage extends StatelessWidget {
  final service = ProductService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi App')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductListPage(service: service),
              ),
            );
          },
          child: const Text('Ver productos'),
        ),
      ),
    );
  }
}
