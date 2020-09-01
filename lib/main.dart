import 'package:flutter/material.dart';
import 'package:magazine_market/screens/base/base_screen.dart';
import 'package:magazine_market/stores/page_store.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:get_it/get_it.dart';

void main() async {
  //O BINDING DO FLUTTER DEVE ESTAR INICIALIZADO ANTES DO PARSE
  WidgetsFlutterBinding.ensureInitialized();
  //ANTES DE INICIAR O APP DEVE-SE INICIAR O PARSE
  await initializeParse();
  setupLocators();//Get_it
  runApp(MyApp());

}
//Get_it é um service locator/localizador de serviços
//Singleton é um objeto que só existe um no app
void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
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
        primaryColor: Colors.deepPurple,
        //primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cursorColor: Colors.orangeAccent,
      ),
      home: BaseScreen(),
    );
  }
}
