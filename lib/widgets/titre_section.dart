// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitreSection extends StatelessWidget {
  final String titre;
  const TitreSection({
    Key? key,
    required this.titre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        titre,
        textAlign: TextAlign.start,
        style: GoogleFonts.nunitoSans(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
