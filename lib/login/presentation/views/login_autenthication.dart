import 'package:firebase_auth/firebase_auth.dart';

class ServiceAuthentication {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String nome,
    required String senha,
    required String email,
  }) async {
    try {
  UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: senha,
  );
  
  await userCredential.user!.updateDisplayName(nome);


  return null;
} on FirebaseAuthException catch (e) {
  if (e.code == "email-already-in-use") {
    return ("O usuário já está cadastrado");
  }

  return "Erro desconhecido";
}
  }

  Future<String?> emailRecuperacao(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return (e.message);
    }
  }
}
