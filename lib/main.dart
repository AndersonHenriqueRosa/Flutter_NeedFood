import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:need_food/views/authentication_page.dart';
import 'package:need_food/views/main_tabwiew/main_tabview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()  async{
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RouterPage(), // Use a LoginPage como a tela inicial
    );
  }
}

class RouterPage extends StatelessWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder:(context, snapshot) {
        if (snapshot.hasData) {
          return MainTabView();
        }else {
          return AuthenticationPage();
        }
      },
      );
  }
}
