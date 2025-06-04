import "package:flutter/material.dart";
import "package:mini_mart/util/constants.dart";
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
      appBar: AppBar(
        leading: isAtHome
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed("/blank"),
              ),
        automaticallyImplyLeading: !isAtHome,
        title: Text(title),
        titleSpacing: 0,
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
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
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
