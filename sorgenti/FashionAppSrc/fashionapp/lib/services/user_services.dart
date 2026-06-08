import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:fashionapp/dto/users/login_post.dart';

class UserService {
  Session session;

  UserService(this.session);

  Future<LoginResponse> login(final String username, final String password) {
    // Costruisce il DTO POST
    LoginPost toPost = LoginPost(email:username, password:password);
  }
}