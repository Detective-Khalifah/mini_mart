import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mini_mart/mini_mart.dart";
import "package:mini_mart/models/product.dart";
import "package:mini_mart/pages/cart_page.dart";
import "package:mini_mart/pages/favourites_page.dart";
import "package:mini_mart/pages/home_page.dart";
import "package:mini_mart/pages/profile_page.dart";
import "package:mini_mart/pages/product_detail_page.dart";
import "package:mini_mart/widgets/blank_page_widget.dart";
import "package:mini_mart/widgets/notification_toast/banner_overlay.dart";
import "package:mini_mart/widgets/app_bar/persistent_app_bar.dart";

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
        fontFamily: "IBMPlexSans",
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: Colors.grey[200],
          surfaceTintColor: Colors.grey[200],
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Color(0xFF60B5FF),
          labelTextStyle: WidgetStateProperty.all(
            Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        scaffoldBackgroundColor: Color(0xFFFBFBFB),
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == "/product_detail") {
          // Extract the arguments from the current ModalRoute
          // settings and cast them as Product.
          // final product = ModalRoute.of(context)!.settings.arguments as Product;
          final product = settings.arguments as Product?;
          return MaterialPageRoute(
            builder: (context) => BannerOverlay(
              child: PersistentAppBar(
                body: ProductDetailPage(product: product),
              ),
            ),
          );
        }
        return null; // Return null for unhandled routes
      },
      routes: {
        "/": (context) => const MiniMart(),
        "/blank": (context) => BlankPageWidget(),
        "/home": (context) =>
            const HomePage(title: "Mini Mart", isAtHome: true),
        "/cart": (context) => const CartPage(),
        "/favourites": (context) => const FavouritesPage(),
        "/profile": (context) => const ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
