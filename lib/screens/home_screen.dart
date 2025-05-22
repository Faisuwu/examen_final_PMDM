import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';
import '../models/plat.dart';
import 'detail_screen.dart';
import 'login_screen.dart';
import '../widgets/plat_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _api = ApiService();
  final StorageService _storage = StorageService();
  late Future<List<Plat>> _futurePlats;

  @override
  void initState() {
    super.initState();
    _futurePlats = _api.fetchPlats();
  }

  void _logout() async {
    await _storage.clearCredentials();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(
      title: const Text('Llistat de Plats'),
      actions: [
        IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
      ],
    ),
    body: FutureBuilder<List<Plat>>(
      future: _futurePlats,
      builder: (ctx, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else if (snap.hasError) {
          return Center(child: Text('Error: ${snap.error}'));
        }
        final plats = snap.data!;
        return ListView.builder(
          itemCount: plats.length,
          itemBuilder: (_, i) => PlatTile(
            plat: plats[i],
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => DetailScreen(plat: plats[i]),
            )),
          ),
        );
      },
    ),
  );
}