import 'package:flutter/material.dart';
import '../models/plat.dart';

class DetailScreen extends StatelessWidget {
  final Plat plat;
  const DetailScreen({ required this.plat });

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: Text(plat.nom)),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            (plat.foto != null && plat.foto!.isNotEmpty)
                ? plat.foto!
                : 'https://upload.wikimedia.org/wikipedia/commons/e/e0/PlaceholderLC.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Text('Id: ${plat.id}'),
          Text('Descripció: ${plat.descripcio}'),
          Text('Tipus: ${plat.tipus}'),
          Row(
            children: [
              const Text('Disponible: '),
              Icon( plat.disponible ? Icons.check : Icons.close,
                  color: plat.disponible ? Colors.green : Colors.red),
            ],
          ),
          const Spacer(),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Borrar plat'),
              onPressed: () {
                //Implementar eliminarplat
              },
            ),
          ),
        ],
      ),
    ),
  );
}