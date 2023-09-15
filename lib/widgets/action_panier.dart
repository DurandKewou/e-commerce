import 'package:ecommerce/pages/pages.dart';
import 'package:ecommerce/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionPanier extends ConsumerWidget {
  const ActionPanier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nombreElements = ref.watch(panierProvider).length;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(PanierPage.routeName);
        },
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
              ),
            ),
            if (nombreElements > 0)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        nombreElements < 9 ? '$nombreElements' : '9+',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
