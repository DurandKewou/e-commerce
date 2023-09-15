// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ProduitPanier {
  final String id;
  final String nomProduit;
  final double prix;
  final int qte;
  final String imageUrl;
  final String idProduit;
  ProduitPanier({
    required this.nomProduit,
    required this.prix,
    required this.qte,
    required this.imageUrl,
    required this.idProduit,
  }) : id = uuid.v4();

  double get total {
    return qte * prix;
  }

  ProduitPanier copyWith({
    String? nomProduit,
    double? prix,
    int? qte,
    String? imageUrl,
    String? idProduit,
  }) {
    return ProduitPanier(
      nomProduit: nomProduit ?? this.nomProduit,
      prix: prix ?? this.prix,
      qte: qte ?? this.qte,
      imageUrl: imageUrl ?? this.imageUrl,
      idProduit: idProduit ?? this.idProduit,
    );
  }
}
