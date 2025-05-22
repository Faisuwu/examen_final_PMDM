import 'package:examen_final_maqueda/widgets/plat_tile.dart';
import 'package:flutter/material.dart';
import '../models/plat.dart';
import '../services/api_service.dart';

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
          ListView.builder(itemBuilder: (_, i) => PlatTile(
            plat: plat,
          ),),
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
              icon: const Icon(Icons.delete),
              label: const Text('Borrar plat'),
              onPressed: () {
                //IMPLEMENTAR BORRAR
              },
            ),
          ),
        ],
      ),
    ),
  );
}