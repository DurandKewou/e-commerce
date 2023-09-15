import 'package:ecommerce/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PanierPage extends ConsumerWidget {
  static const routeName = '/panier';
  const PanierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monPanier = ref.watch(panierProvider);
    final totalPanier = ref.read(panierProvider.notifier).totalPanier;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Panier(${monPanier.length})'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: monPanier.length,
              itemBuilder: (context, index) => ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    monPanier[index].imageUrl,
                    height: 40,
                    width: 40,
                  ),
                ),
                title: Text(
                  monPanier[index].nomProduit,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: GoogleFonts.openSans(),
                ),
                subtitle: Text(
                  '\$${monPanier[index].prix} x ${monPanier[index].qte}',
                  style: GoogleFonts.openSans(
                    color: Colors.orange,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        final removeproduit = ref
                            .read(produitsProviders.notifier)
                            .findProduitbyId(monPanier[index].idProduit);
                        ref
                            .read(panierProvider.notifier)
                            .retirerElement(removeproduit);
                      },
                      color: Colors.black,
                      icon: const Icon(Icons.remove),
                    ),
                    const Gap(16),
                    IconButton(
                      onPressed: () {
                        final produit = ref
                            .read(produitsProviders.notifier)
                            .findProduitbyId(monPanier[index].idProduit);
                        ref
                            .read(panierProvider.notifier)
                            .ajouterElement(produit);
                      },
                      color: Colors.orange,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Payer \$$totalPanier'),
            ),
          ),
        ],
      ),
    );
  }
}
