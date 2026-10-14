import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/login.dart';
import 'screens/welcome.dart';
import 'screens/cadastro.dart';

import 'screens/conta.dart';
import 'screens/descubra.dart';
import 'screens/historico.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de 'Debug' do canto da tela
      title: 'UniDrive',
      // theme: ThemeData(
      //   useMaterial3: true,
      //   textTheme: GoogleFonts.montserratTextTheme(),
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        // '/login': (context) => const Login(),
        // '/cadastro': (context) => const Cadastro(),
        // '/home': (context) => const MainShell(),
        // '/descubra': (context) => const Descubra(),
        // '/historico': (context) => const Historico(),
        // '/conta': (context) => const Conta(),

      },
  
    );
  }
}



