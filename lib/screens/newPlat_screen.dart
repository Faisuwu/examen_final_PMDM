import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/plat.dart';
import '../widgets/plat_tile.dart';

class NewPlat extends StatelessWidget {

  late final Plat plat;

  //Pagina de formulari per fer el nou producte
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: Text(plat.nom)),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Nom del producte:'),
            TextFormField(
              initialValue: '',
              onChanged: ( value ) => plat.nom = value,
              validator: ( value ) { if(value == null || value.length < 1) return 'El nom es obligatori';},
            ),
            SizedBox(height: 30),
            Text('Descripcio del producte:'),
            TextFormField(
              initialValue: '',
              onChanged: ( value ) => plat.descripcio = value,
              validator: ( value ) { if(value == null || value.length < 1) return 'La descripció es obligatoria';},
            ),
            SizedBox(height: 30),
            SwitchListTile.adaptive(
              value: plat.disponible,
              title: Text('Disponible'),
              activeColor: Colors.indigo,
              onChanged: ( value ) => plat.disponible = value,
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    ),
  );
}