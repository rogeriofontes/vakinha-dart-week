import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_cart_service.dart';
import 'package:vakinha_burger_mobile/app/modules/Menu/Menu_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/Menu/Menu_page.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_cart/shopping_cart_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_cart/shopping_cart_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  final ShoppingCartService _shoppingCartService;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_card', '/exit'];

  HomeController({required ShoppingCartService shoppingCartService})
      : _shoppingCartService = shoppingCartService;

  int get tabIndex => _tabIndex.value;

  int get totalProductsInShoppingCard => _shoppingCartService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/order/shopping_card') {
      return GetPageRoute(
          settings: settings,
          page: () => ShoppingCartPage(),
          binding: ShoppingCartBindings(),
          transition: Transition.fadeIn);
    }
  }
}
