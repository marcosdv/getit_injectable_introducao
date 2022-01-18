import 'package:flutter/material.dart';
import 'package:get_it_introducao/injection/injection.dart';
import 'package:get_it_introducao/managers/session_manager.dart';
import 'package:get_it_introducao/models/user.dart';
import 'package:get_it_introducao/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Entrar'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const HomePage())
                );
              },
            ),
            ElevatedButton(
              child: const Text('Remover Session Manager'),
              onPressed: () {
                print(getIt.isRegistered<SessionManager>());

                //exclui o registro do SessionManager do getIt
                //getIt.unregister<SessionManager>();

                //refaz o registro do SessionManager do getIt
                //getIt.registerSingleton(SessionManager(getIt()));

                //reseta o registro do SessionManager do getIt, sem excluir, apenas libera a memoria, quando precisar novamente, ele criar automaticamente
                getIt.resetLazySingleton<SessionManager>();

                print(getIt.isRegistered<SessionManager>());
              },
            ),
          ],
        ),
      ),
    );
  }
}
