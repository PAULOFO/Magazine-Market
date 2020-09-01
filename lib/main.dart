import 'package:flutter/material.dart';
import 'package:magazine_market/screens/base/base_screen.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  //O BINDING DO FLUTTER DEVE ESTAR INICIALIZADO ANTES DO PARSE
  WidgetsFlutterBinding.ensureInitialized();
  //ANTES DE INICIAR O APP DEVE-SE INICIAR O PARSE
  await initializeParse();
  runApp(MyApp());

}

Future<void> initializeParse() async {
  await Parse().initialize(
  'wOunKxBnNKvh9jQl9uVdHp9BmtYhjR7U28qZ91Rf',
  'https://parseapi.back4app.com/',
  clientKey: 'QpuCDLaA84CNeS55BYr6plgWVQkJRmLlOKLzaIhL',
  autoSendSessionId: true,
  debug: true,
  );
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magazine Market',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
