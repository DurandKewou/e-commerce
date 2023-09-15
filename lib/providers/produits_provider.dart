import 'package:ecommerce/data/produits.dart';
import 'package:ecommerce/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProduitsProvider extends StateNotifier<List<Produit>> {
  ProduitsProvider() : super(mesProduits);

  Produit findProduitbyId(String id) {
    return state.firstWhere((element) => element.id == id);
  }
}

final produitsProviders =
    StateNotifierProvider<ProduitsProvider, List<Produit>>(
  (ref) => ProduitsProvider(),
);
