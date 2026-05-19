import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../utils/form_validators.dart';

class ProductFormPage extends StatefulWidget {
  final ProductService service;
  const ProductFormPage({super.key, required this.service});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController  = TextEditingController();
  final priceController = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Producto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  final r = FormValidators.required(value);
                  if (r != null) return r;
                  return FormValidators.minLength(value);
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: FormValidators.onlyNumbers,
              ),

              const SizedBox(height: 24),

              _saving
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => _saving = true);
                          await widget.service.save(
                            nameController.text,
                            priceController.text,
                          );
                          setState(() => _saving = false);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Guardado')),
                            );
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: const Text('Guardar'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
