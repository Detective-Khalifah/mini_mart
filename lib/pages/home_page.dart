import "package:flutter/material.dart";
import "package:mini_mart/util/constants.dart";
import "package:mini_mart/widgets/app_bar/custom_app_bar.dart";
import "package:mini_mart/widgets/product_card.dart";

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.title,
    this.category,
    this.isAtHome = false,
  });

  final bool isAtHome;
  final String? category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        isAtHome: isAtHome,
        route: isAtHome ? null : "/blank",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (category != null)
                Text(category!, style: TextStyle(fontSize: 24)),
              const SizedBox(height: 16),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 240,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: Constants.products[index]);
                },
                itemCount: Constants.products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
