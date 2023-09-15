// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'models.dart';

enum StautCommande {
  acceptee,
  annulee,
  livraison,
  terminer,
}

enum StatutPaiement { paye, attente }

class Commande {
  final List<ProduitPanier> panier;
  final String id;
  final DateTime date;
  final StautCommande statut;
  final StatutPaiement paiement;
  Commande({
    required this.panier,
    required this.id,
    required this.date,
    required this.statut,
    required this.paiement,
  });

  factory Commande.autoId({
    required List<ProduitPanier> panier,
    required DateTime date,
    required StautCommande statut,
    required StatutPaiement paiement,
  }) =>
      Commande(
        panier: panier,
        id: uuid.v4(),
        date: date,
        statut: statut,
        paiement: paiement,
      );

  Commande copyWith({
    List<ProduitPanier>? panier,
    String? id,
    DateTime? date,
    StautCommande? statut,
    StatutPaiement? paiement,
  }) {
    return Commande(
      panier: panier ?? this.panier,
      id: id ?? this.id,
      date: date ?? this.date,
      statut: statut ?? this.statut,
      paiement: paiement ?? this.paiement,
    );
  }
}
