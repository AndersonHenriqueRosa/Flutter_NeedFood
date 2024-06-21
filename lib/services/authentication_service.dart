import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   Future<String?> registerUser({
    required String username, 
    required String email, 
    required String phone, 
    required String address, 
    required String password,
    }) async {
      try {
  UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  
    await userCredential.user!.updateDisplayName(username);

    return null;
} on FirebaseAuthException catch (e) {
  if (e.code == "email-already-in-use") {
    return "Usuário já possui cadastro no sistema";
  }
  return "Erro desconhecido";
}
    }
    Future<String?> loginUser(
      {required String email, required String password}) async { 
        try {
  await _firebaseAuth.signInWithEmailAndPassword(
  email: email, password: password);
  return null;
} on FirebaseAuthException catch (e) {
  return e.message;
}
    }
    Future<void> logout() async {
      return _firebaseAuth.signOut();
    }
}