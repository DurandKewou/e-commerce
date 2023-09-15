import 'package:ecommerce/providers/providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ecommerce/models/models.dart';
import 'package:gap/gap.dart';

import 'package:transparent_image/transparent_image.dart';

class ProduitGridItem extends ConsumerWidget {
  final Produit produit;
  const ProduitGridItem({
    Key? key,
    required this.produit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorie = ref.read(categorieProvider).firstWhere(
          (cat) => cat.id == produit.categorieid,
        );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF8F9FB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(produit.imageUrl),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(16),
                Text(
                  produit.nom,
                  style: GoogleFonts.openSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                Text(
                  categorie.name.toUpperCase(),
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${produit.prix.toStringAsFixed(2)}',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(panierProvider.notifier)
                            .ajouterElement(produit);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'votre panier à ete mis à jour!',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
