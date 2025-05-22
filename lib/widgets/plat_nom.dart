import 'package:flutter/material.dart';
import '../models/plat.dart';

class PlatNom extends StatelessWidget {
  final Plat plat;
  final VoidCallback onTap;
  const PlatNom({ required this.plat, required this.onTap });

  @override
  Widget build(BuildContext c) => ListTile(
    title: Text(plat.nom),
    onTap: onTap,
  );
}