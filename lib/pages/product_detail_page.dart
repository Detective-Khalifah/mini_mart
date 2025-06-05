import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mini_mart/models/product.dart";
import "package:mini_mart/providers/favourites_provider.dart";
import "package:mini_mart/widgets/buttons/add_to_cart_button.dart";
import "package:mini_mart/widgets/app_bar/custom_app_bar.dart";
import "package:mini_mart/widgets/notification_toast/banner_overlay.dart";
import "package:phosphor_flutter/phosphor_flutter.dart";

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Go back"),
      body: product == null
          ? Center(child: Text("Product unavailable"))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 9,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 400,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Hero(
                                      tag:
                                          "product_image_${product!.imagePath}",
                                      child: Image.asset(
                                        product!.imagePath,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error,
                                                stackTrace) =>
                                            const Center(
                                                child: Text("Image not found")),
                                      ),
                                    ),
                                  ),
                                ),
                                Consumer(
                                  builder: (BuildContext context, WidgetRef ref,
                                      Widget? child) {
                                    final favorites =
                                        ref.watch(favouritesProvider);
                                    final favouritesNotifier =
                                        ref.read(favouritesProvider.notifier);
                                    final isFavourite =
                                        favorites.contains(product);

                                    return Positioned(
                                      top: 8,
                                      right: 8,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          onPressed: () {
                                            favouritesNotifier
                                                .toggleFavourite(product!);
                                            BannerOverlay.of(context)?.showBanner(
                                                "${product!.name} added to favorites");
                                          },
                                          icon: Icon(
                                            isFavourite
                                                ? PhosphorIcons.heart(
                                                    PhosphorIconsStyle.fill)
                                                : PhosphorIcons.heart(),
                                          ),
                                          color:
                                              isFavourite ? Colors.red : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Flexible(
                                child: Hero(
                                  tag: "product_name_${product!.id}",
                                  child: Text(
                                    product!.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                child: Hero(
                                  tag: "product_specs_${product!.id}",
                                  child: Text(
                                    product!.specs.join("|"),
                                    softWrap: true,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Hero(
                            tag: "product_price_${product!.id}",
                            child: Text(
                              "\$${product!.price.toStringAsFixed(2)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontSize: 32.75,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "About this item",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Wrap(
                              children: product!.description.map((descItem) {
                                return Text(
                                  "- $descItem",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                  AddToCartButton(product: product!),
                ],
              ),
            ),
    );
  }
}
