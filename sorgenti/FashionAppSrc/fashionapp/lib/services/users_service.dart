import 'package:fashionapp/dto/users/login_post.dart';
import 'package:fashionapp/dto/users/login_response.dart';
import 'package:fashionapp/dto/users/signup_post.dart';
import 'package:fashionapp/helpers/session.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class UsersService {
  final Session session;

  UsersService(this.session);

  Future<LoginResponse> login(final String username, final String password) async {
    LoginPost toPost = LoginPost(email:username, password:password);

    final Uri url = Uri.parse('${session.baseUrl}/login');

    final http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(toPost.toJson()),
    );

    final dynamic decodedBody = jsonDecode(response.body);

    if (response.statusCode != 200) {
      if (decodedBody is Map<String, dynamic>) {
        final String errorCode = decodedBody['errorCode']?.toString() ?? 'ERR_UNKNOWN';
        final String message = decodedBody['message']?.toString() ?? 'Errore sconosciuto';

        throw Exception('$errorCode - $message');
      }

      throw Exception('HTTP ${response.statusCode} - Errore sconosciuto');
    }

    if (decodedBody is! Map<String, dynamic>) {
      throw Exception('Risposta non valida dal server');
    }

    return LoginResponse.fromJson(decodedBody);
  }

  Future<bool> signup(final SignupPost toPost) async {

    final Uri url = Uri.parse('${session.baseUrl}/users/signup');

    final http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(toPost.toJson()),
    );

    final dynamic decodedBody = jsonDecode(response.body);

    if (response.statusCode != 201) {
      if (decodedBody is Map<String, dynamic>) {
        final String errorCode = decodedBody['errorCode']?.toString() ?? 'ERR_UNKNOWN';
        final String message = decodedBody['message']?.toString() ?? 'Errore sconosciuto';

        throw Exception('$errorCode - $message');
      }

      throw Exception('HTTP ${response.statusCode} - Errore sconosciuto');
    }

    return true;
  }

}