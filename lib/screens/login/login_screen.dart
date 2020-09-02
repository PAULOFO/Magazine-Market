import 'package:flutter/material.dart';
import 'package:magazine_market/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
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
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 20,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, bottom: 4, top: 8),
                    child: Text(
                      'E-mail:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                   TextField(
                     decoration: InputDecoration(
                       border: const OutlineInputBorder(),
                       isDense: true,
                       hintText: 'Digite seu E-mail',
                     ),
                     keyboardType: TextInputType.emailAddress,
                   ),
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
                                color: Colors.deepPurple[700],
                            ),
                          ),
                          onTap: (){},
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true,
                      hintText: 'Crie uma Senha',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: RaisedButton(
                      color: Colors.orangeAccent,
                      child: Text('ENTRAR'),
                        textColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        onPressed: (){},
                    ),
                  ),
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
                              color: Colors.deepPurple,
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
    );
  }
}
