import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/storage_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _auth = AuthService();
  final _storage = StorageService();
  bool _loading = false;
  bool guardarCreedencials = false;


  void _login() async {
    setState(() => _loading = true);
    final ok = await _auth.login(_userCtrl.text, _passCtrl.text);
    setState(() => _loading = false);
    if (ok) {
      await _storage.saveCredentials(_userCtrl.text, _passCtrl.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Credencials incorrectes')));
    }
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Login')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(controller: _userCtrl, decoration: const InputDecoration(labelText: 'Usuari')),
          TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Contrasenya'), obscureText: true),
          Checkbox(value: guardarCreedencials, onChanged: (bool? newValue){setState((){guardarCreedencials = true;});}),
          const SizedBox(height: 20),
          _loading
              ? const CircularProgressIndicator()
              : ElevatedButton(onPressed: _login, child: const Text('Entrar')),
        ],
      ),
    ),
  );
}