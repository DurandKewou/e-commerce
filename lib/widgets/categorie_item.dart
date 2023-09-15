// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/models/models.dart';
import 'package:flutter/material.dart';

class CategorieItem extends StatelessWidget {
  final Categorie categorie;
  const CategorieItem({
    Key? key,
    required this.categorie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            categorie.name,
          ),
        ),
      ),
    );
  }
}
