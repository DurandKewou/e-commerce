import 'package:ecommerce/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.orange,
        ),
        initialRoute: '/',
        routes: {
          ListeArticles.routeName: (cxt) => const ListeArticles(),
          PanierPage.routeName: (ctx) => const PanierPage(),
        },
      ),
    ),
  );
}
