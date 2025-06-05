import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mini_mart/pages/cart_page.dart";
import "package:mini_mart/pages/favourites_page.dart";
import "package:mini_mart/pages/home_page.dart";
import "package:mini_mart/pages/profile_page.dart";
import "package:mini_mart/providers/cart_provider.dart";
import "package:mini_mart/widgets/persistent_app_bar.dart";

class MiniMart extends ConsumerStatefulWidget {
  const MiniMart({super.key});

  @override
  ConsumerState<MiniMart> createState() => _MiniMartState();
}

class _MiniMartState extends ConsumerState<MiniMart> {
  late PageController _pageController;
  static const List<Widget> _pages = <Widget>[
    HomePage(
      title: "Technology",
      category: "Smartphones, Laptops & Accessories",
    ),
    CartPage(),
    FavouritesPage(), // to be implemented
    ProfilePage(), // to be implemented
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider).length;

    return Scaffold(
      appBar: PersistentAppBar(),
      body: PageView(
        controller: _pageController,
        children: [_pages[_selectedIndex]],
      ),
      bottomNavigationBar: NavigationBar(
        height: 96,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: [
          // Default size -- 24
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: cart > 0 ? true : false,
              label: Text(cart.toString()),
              backgroundColor: Colors.blueGrey,
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Cart',
            selectedIcon: Icon(Icons.shopping_cart_rounded),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
            selectedIcon: Icon(Icons.favorite_sharp),
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
            selectedIcon: Icon(CupertinoIcons.person_circle),
          ),
        ],
      ),
    );
  }
}
