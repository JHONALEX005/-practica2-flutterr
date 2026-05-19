import 'package:uuid/uuid.dart';
import '../models/product_model.dart';

class ProductService {
  final List<Product> _products = [];
  final _uuid = const Uuid();

  List<Product> getAll() {
    return _products;
  }

  Future<void> save(String name, String price) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _products.add(Product(
      id: _uuid.v4(),
      name: name,
      price: price,
    ));
  }

  Future<void> delete(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _products.removeWhere((p) => p.id == id);
  }
}
