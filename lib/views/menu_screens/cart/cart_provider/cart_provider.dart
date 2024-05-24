import 'package:flutter/material.dart';
import 'package:lmsapp/models/cart_model.dart';
import 'package:lmsapp/models/wishlist_model.dart';
import 'package:lmsapp/utilities/utils.dart';
import 'package:lmsapp/views/menu_screens/cart/service/cart_services.dart';

class CartProvider extends ChangeNotifier {
  CartModel? _cartModel;
  CartModel? get cart => _cartModel;

  WishlistModel? _wishlistModel;
  WishlistModel? get wishlist => _wishlistModel;

  bool loadinggetcart = false;
  bool loadinggetwishlist = false;
  bool loadingaddtocart = false;
  bool loadingremovecart = false;

  getCartData() async {
    var tokken = await Utils.getToken();
    try {
      loadinggetcart = true;
      notifyListeners();
      await fetchCartdata(tokken).then((policy) {
        _cartModel = CartModel.fromJson(policy);
        loadinggetcart = false;
        notifyListeners();
      });
    } catch (e) {
      loadinggetcart = false;
      notifyListeners();
      rethrow;
    }
  }

  getaddcart(id, context) async {
    var tokken = await Utils.getToken();
    try {
      loadingaddtocart = true;
      notifyListeners();
      await fetchAddCart(tokken, id).then((policy) {
        if (policy['status'] == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(policy['message'])));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(policy['message'])));
        }
        loadingaddtocart = false;
        notifyListeners();
        print(policy);
      });
    } catch (e) {
      loadingaddtocart = false;
      notifyListeners();
      rethrow;
    }
  }

  getremovecart(id, context) async {
    var tokken = await Utils.getToken();
    try {
      loadingremovecart = true;
      notifyListeners();
      await fetchRemoveCart(tokken, id).then((policy) {
        if (policy['status'] == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(policy['message'])));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(policy['message'])));
        }
        loadingremovecart = false;
        notifyListeners();
      });
    } catch (e) {
      loadingremovecart = false;
      notifyListeners();
      rethrow;
    }
  }

  getWishlistData() async {
    var tokken = await Utils.getToken();
    try {
      loadinggetwishlist = true;
      notifyListeners();
      await fetchWishlistdata(tokken).then((policy) {
        _wishlistModel = WishlistModel.fromJson(policy);
        loadinggetwishlist = false;
        notifyListeners();
      });
    } catch (e) {
      loadinggetcart = false;
      notifyListeners();
      rethrow;
    }
  }
}
