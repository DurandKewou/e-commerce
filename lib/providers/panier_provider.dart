import 'package:ecommerce/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PanierProvider extends StateNotifier<List<ProduitPanier>> {
  PanierProvider() : super([]);

  void ajouterElement(Produit produit) {
    final index =
        state.indexWhere((element) => element.idProduit == produit.id);
    if (index == -1) {
      state = [
        ...state,
        ProduitPanier(
          nomProduit: produit.nom,
          prix: produit.prix,
          qte: 1,
          imageUrl: produit.imageUrl,
          idProduit: produit.id,
        ),
      ];
    } else {
      final ancienPP = state[index];
      final nouveauPP = ancienPP.copyWith(qte: ancienPP.qte + 1);
      final nouveauState = List.of(state);
      nouveauState[index] = nouveauPP;
      state = nouveauState;
    }
  }

  void retirerElement(Produit produit) {
    final index = state.indexWhere(
      (element) => element.idProduit == produit.id,
    );
    final pp = state[index];
    if (pp.qte == 1) {
      final nouveauState = List.of(state);
      nouveauState.removeAt(index);
      state = nouveauState;
    } else {
      final newPP = pp.copyWith(qte: pp.qte - 1);
      final nouveauState = List.of(state);
      nouveauState[index] = newPP;
      state = nouveauState;
    }
  }

  double get totalPanier {
    var total = 0.0;
    for (var pp in state) {
      total = total + pp.total;
    }
    return total;
  }

  void viderPanier() {
    state = [];
  }
}

final panierProvider =
    StateNotifierProvider<PanierProvider, List<ProduitPanier>>(
  (ref) => PanierProvider(),
);
