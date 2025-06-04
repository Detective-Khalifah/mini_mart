import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mini_mart/mini_mart.dart";
import "package:mini_mart/models/product.dart";
import "package:mini_mart/pages/cart_page.dart";
import "package:mini_mart/pages/favourites_page.dart";
import "package:mini_mart/pages/home_page.dart";
import "package:mini_mart/pages/profile_page.dart";
import "package:mini_mart/pages/view_product_page.dart";

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // home: const MiniMart(),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == "/view_product") {
          // Extract the arguments from the current ModalRoute
          // settings and cast them as Product.
          // final product = ModalRoute.of(context)!.settings.arguments as Product;
          final product = settings.arguments as Product?;
          return MaterialPageRoute(
            builder: (context) => ViewProductPage(product: product),
          );
        }
        return null; // Return null for unhandled routes
      },
      routes: {
        "/": (context) => const MiniMart(),
        "/blank": (context) => Scaffold(
              body: Center(
                child: TextButton(
                  child: Text("Blank Page"),
                  onPressed: () => Navigator.pushReplacementNamed(context, "/"),
                ),
              ),
            ),
        "/home": (context) =>
            const HomePage(title: "Mini Mart", isAtHome: true),
        // TODO: Replace with actual product data or pass it dynamically
        // "/view_product": (context) => const ViewProductPage(product: null),
        "/cart": (context) => const CartPage(),
        "/favourites": (context) => const FavouritesPage(),
        "/profile": (context) => const ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
