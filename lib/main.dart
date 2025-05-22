import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final StorageService _storage = StorageService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plats App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder(
        //future: _storage.getCredentials(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          final creds = snapshot.data as Map<String,String>?;
          if (creds != null) {
            //return HomeScreen();
          }
          //return LoginScreen();
        },
      ),
    );
  }
}
