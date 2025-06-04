import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mini_mart/pages/cart_page.dart";
import "package:mini_mart/pages/favourites_page.dart";
import "package:mini_mart/pages/home_page.dart";
import "package:mini_mart/pages/profile_page.dart";
import "package:mini_mart/providers/cart_provider.dart";

class MiniMart extends ConsumerStatefulWidget {
  const MiniMart({super.key});

  @override
  ConsumerState<MiniMart> createState() => _MiniMartState();
}

class _MiniMartState extends ConsumerState<MiniMart> {
  late PageController _pageController;
  static const List<Widget> _pages = <Widget>[
    HomePage(
        title: "Technology", category: "Smartphones, Laptops & Accessories"),
    CartPage(), // to be implemented
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
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: TextButton(
          child: Text("Full Logo"),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DELIVERY ADDRESS",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "Umuezike Road, Oyo State",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [_pages[_selectedIndex]],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: [
          // Default size -- 24
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
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
