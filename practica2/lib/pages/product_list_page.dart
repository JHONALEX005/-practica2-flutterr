import 'package:flutter/material.dart';
import '../services/product_service.dart';
import 'product_form_page.dart';

class ProductListPage extends StatefulWidget {
  final ProductService service;
  const ProductListPage({super.key, required this.service});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final products = widget.service.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductFormPage(service: widget.service),
            ),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? const Center(child: Text('No hay productos aun'))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final p = products[index];
                    return ListTile(
                      title: Text(p.name),
                      subtitle: Text('Precio: \$${p.price}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          setState(() => _loading = true);
                          await widget.service.delete(p.id);
                          setState(() => _loading = false);
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
