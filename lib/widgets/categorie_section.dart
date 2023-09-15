import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../providers/providers.dart';

class CategorieSection extends ConsumerWidget {
  const CategorieSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.read(categorieProvider);
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const Gap(16),
          for (var cat in categories) ...[
            CategorieItem(categorie: cat),
            const Gap(20),
          ]
        ],
      ),
    );
  }
}
