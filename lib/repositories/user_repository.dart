import 'package:magazine_market/models/user.dart';
import 'package:magazine_market/repositories/table_keys.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserRepository {

  //Cadastro do Usuário
  Future<void> signUp(User user) async {
    final parseUser = ParseUser(
        user.email, user.password, user.email
        //username, password, emailAddress
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);

    await parseUser.signUp();
  }
}

///NÃO É POSSÍVEL SALVAR UM ENUMERADOR NO PARSE, POR ISSO É NECESSÁRIO
///TRANSFORMAR EM index, OU SEJA, 0 PARA PARTICULAR E 1 P/ PROFISSIONAL.
///E PRECISO SETAR O UserType P/ PARTICULAR.
///SE O USUÁRIO NÃO ESCOLHER NENHUM TIPO ELE FICARÁ PARTICULAR POR PADRÃO