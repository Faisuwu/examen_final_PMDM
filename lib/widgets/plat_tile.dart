import 'package:flutter/material.dart';
import '../models/plat.dart';

class PlatTile extends StatelessWidget {
  final Plat plat;
  const PlatTile({ required this.plat});

  @override
  Widget build(BuildContext c) => ListTile(
    leading: Image.network(
      (plat.foto != null && plat.foto!.isNotEmpty)
          ? plat.foto!
          : 'https://upload.wikimedia.org/wikipedia/commons/e/e0/PlaceholderLC.png',
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    ),
  );
}