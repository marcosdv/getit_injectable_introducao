import 'package:flutter/material.dart';
import 'package:get_it_introducao/injection/injection.dart';
import 'package:get_it_introducao/managers/session_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final sessionManager = GetIt.I.get<SessionManager>();
  final SessionManager sessionManager = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(sessionManager.user?.name ?? 'Sem usuário Logado'),),
    );
  }
}
