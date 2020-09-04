import 'package:magazine_market/models/user.dart';
import 'package:magazine_market/repositories/parse_errors.dart';
import 'package:magazine_market/repositories/table_keys.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserRepository {

  //Cadastro do Usuário
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(
        user.email, user.password, user.email
        //username, password, emailAddress
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if(response.success){
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if(response.success){
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }
  
  User mapParseToUser(ParseUser parseUser){
    return User(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }
  
}

///NÃO É POSSÍVEL SALVAR UM ENUMERADOR NO PARSE, POR ISSO É NECESSÁRIO
///TRANSFORMAR EM index, OU SEJA, 0 PARA PARTICULAR E 1 P/ PROFISSIONAL.
///E PRECISO SETAR O UserType P/ PARTICULAR.
///SE O USUÁRIO NÃO ESCOLHER NENHUM TIPO ELE FICARÁ PARTICULAR POR PADRÃO
///   type: UserType.values[parseUser.get(keyUserType)],