import 'package:flutter/material.dart';
import 'package:lmsapp/models/cart_model.dart';
import 'package:lmsapp/models/wishlist_model.dart';
import 'package:lmsapp/utilities/utils.dart';
import 'package:lmsapp/views/menu_screens/cart/service/cart_services.dart';

class CartProvider extends ChangeNotifier {
  bool loadinggetcart = false;

  bool loadingaddtocart = false;
  bool loadingremovecart = false;
  int cartItems = 0;
  CartModel? _cartModel;
  CartModel? get cart => _cartModel;

  increaseCartItems() {
    cartItems++;
    notifyListeners();
  }

  decreaseCartItems() {
    cartItems--;
    notifyListeners();
  }

  getCartData() async {
    var tokken = await Utils.getToken();
    try {
      loadinggetcart = true;
      notifyListeners();
      await fetchCartdata(tokken).then((policy) {
        _cartModel = CartModel.fromJson(policy);
        cartItems = _cartModel!.data!.cartItems!.length;
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
        if (policy['success'] == true) {
          increaseCartItems();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(policy['message'])));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(policy['message'])));
        }
        loadingaddtocart = false;
        notifyListeners();
      });
    } catch (e) {
      loadingaddtocart = false;
      notifyListeners();
      rethrow;
    }
  }

  getremovecart(id, context, index) async {
    var tokken = await Utils.getToken();
    try {
      loadingremovecart = true;
      notifyListeners();
      var policy = await fetchRemoveCart(tokken, id);
      if (policy['success'] == true) {
        decreaseCartItems();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(policy['message'])));
        cart!.data!.cartItems!.removeAt(index);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(policy['message'])));
      }
      loadingremovecart = false;
      notifyListeners();
    } catch (e) {
      loadingremovecart = false;
      notifyListeners();
      rethrow;
    }
  }
}
