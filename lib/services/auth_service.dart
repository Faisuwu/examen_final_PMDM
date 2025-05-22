class AuthService {
  // Comprova si usuari i contrasenya no són buits
  Future<bool> login(String user, String pass) async {
    await Future.delayed(const Duration(seconds: 1));
    return user.isNotEmpty && pass.isNotEmpty;
  }
}