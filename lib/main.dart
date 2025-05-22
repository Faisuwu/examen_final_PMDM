import 'package:examen_final_maqueda/screens/home_screen.dart';
import 'package:examen_final_maqueda/screens/login_screen.dart';
import 'package:examen_final_maqueda/screens/newPlat_screen.dart';
import 'package:examen_final_maqueda/services/storage_service.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final StorageService _storage = StorageService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plats App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder(
        future: _storage.getCredentials(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          final creds = snapshot.data as Map<String,String>?;
          if (creds != null) {
            return HomeScreen();
          }
          return LoginScreen();
        },
      ),
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'afegir': (_) => NewPlat()
      },
      
    );
  }
}
