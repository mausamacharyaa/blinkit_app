import 'package:flutter/material.dart';

class UiHelper {
  static CustomImage({required String img}) {
    return Image.asset('assets/images/$img');
  } 
}


import 'package:flutter/foundation.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  void addToCart(Product product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);
    
    if (existingIndex >= 0) {
      _items[existingIndex].incrementQuantity();
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index].incrementQuantity();
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].decrementQuantity();
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  bool isInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }

  int getQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    return index >= 0 ? _items[index].quantity : 0;
  }
}

import 'package:flutter/foundation.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  // Mock data - replace with API calls
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    _products = [
      Product(
        id: '1',
        name: 'Amul Gold Milk',
        description: 'Fresh full cream milk',
        price: 60,
        discountedPrice: 58,
        imageUrl: 'https://via.placeholder.com/150',
        category: 'Dairy',
        unit: '500 ml',
      ),
      Product(
        id: '2',
        name: 'Britannia Bread',
        description: 'Whole wheat bread',
        price: 45,
        discountedPrice: 42,
        imageUrl: 'https://via.placeholder.com/150',
        category: 'Bakery',
        unit: '400 g',
      ),
      // Add more products
    ];

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    _categories = [
      Category(
        id: '1',
        name: 'Vegetables & Fruits',
        imageUrl: 'https://via.placeholder.com/150',
        iconUrl: 'https://via.placeholder.com/50',
      ),
      Category(
        id: '2',
        name: 'Dairy & Breakfast',
        imageUrl: 'https://via.placeholder.com/150',
        iconUrl: 'https://via.placeholder.com/50',
      ),
      // Add more categories
    ];
    notifyListeners();
  }

  List<Product> getProductsByCategory(String categoryId) {
    return _products.where((product) => product.category == categoryId).toList();
  }

  Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}