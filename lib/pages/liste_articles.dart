import 'package:ecommerce/providers/produits_provider.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ListeArticles extends ConsumerWidget {
  static const routeName = '/';

  const ListeArticles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mesProduits = ref.watch(produitsProviders);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ActionPanier(),
        ],
        title: const Text('FUTURE Shopping'),
      ),
      body: Column(
        children: [
          const Gap(16),
          const CategorieSection(),
          const Gap(16),
          const TitreSection(titre: 'Nos produits'),
          Expanded(
            child: SectionProduit(
              listeProduits: mesProduits,
            ),
          ),
        ],
      ),
    );
  }
}
