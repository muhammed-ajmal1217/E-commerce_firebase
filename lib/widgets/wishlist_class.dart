import 'package:flutter/foundation.dart';
import 'package:myapp/model/product_model.dart';

class Wishlist extends ChangeNotifier {
  static final Wishlist _instance = Wishlist._internal();
  List<ProductModel> wishlistItems = [];

  factory Wishlist() {
    return _instance;
  }

  Wishlist._internal();

  

  void addToWishlist(ProductModel product) {
    if (!wishlistItems.contains(product)) {
      wishlistItems.add(product);
      notifyListeners(); // Notify listeners when the wishlist is modified
    }
  }

  void removeFromWishlist(ProductModel product) {
    wishlistItems.remove(product);
    notifyListeners(); // Notify listeners when the wishlist is modified
  }

  bool isWishlistItem(ProductModel product) {
    return wishlistItems.contains(product);
  }
}