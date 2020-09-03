import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:magazine_market/components/error_box.dart';
import 'package:magazine_market/screens/signup/signup_screen.dart';
import 'package:magazine_market/stores/login_store.dart';

class LoginScreen extends StatelessWidget {

  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Acessar com E-mail:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[900],
                      ),
                    ),
                    Observer(builder: (_){
                      return Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                        child: ErrorBox(
                          message: loginStore.error,
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4,),
                      child: Text(
                        'E-mail:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                     Observer(builder: (_){
                       return TextField(
                         enabled: !loginStore.loading,
                         decoration: InputDecoration(
                           border: const OutlineInputBorder(),
                           isDense: true,
                           hintText: 'Digite seu E-mail',
                           errorText: loginStore.emailError,
                         ),
                         keyboardType: TextInputType.emailAddress,
                         onChanged: loginStore.setEmail,
                       );
                     }),
                    const SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, bottom: 4, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Senha:',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: Colors.redAccent,
                              ),
                            ),
                            onTap: (){},
                          ),
                        ],
                      ),
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !loginStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Digite sua Senha',
                          errorText: loginStore.passwordError,
                        ),
                        obscureText: true,
                        onChanged: loginStore.setPassword,
                      );
                    }),
                    const SizedBox(height: 16,),
                   Observer(builder: (_){
                     return  Container(
                       height: 40,
                       margin: const EdgeInsets.symmetric(vertical: 12),
                       child: RaisedButton(
                         color: Colors.orangeAccent,
                         disabledColor: Colors.orangeAccent.withAlpha(120),
                         child: loginStore.loading
                             ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              )
                             :  Text('ENTRAR'),
                         textColor: Colors.white,
                         elevation: 10,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(50),
                         ),
                         onPressed: loginStore.loginPressed,
                       ),
                     );
                   }),
                    Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 12),
                      child: Wrap(
                        children: [
                          const Text(
                            'Não tem uma conta?',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: (){
                               Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                            },
                            child: Text(
                              'Cadastre-se',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.redAccent,
                                fontSize: 16,
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
