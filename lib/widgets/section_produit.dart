import 'package:ecommerce/widgets/produit_grid_item.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/models/models.dart';

class SectionProduit extends StatelessWidget {
  final List<Produit> listeProduits;
  const SectionProduit({
    Key? key,
    required this.listeProduits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: listeProduits.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12.0),
        child: ProduitGridItem(
          produit: listeProduits[index],
        ),
      ),
    );
  }
}
