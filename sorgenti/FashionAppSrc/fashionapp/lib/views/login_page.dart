import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fashionapp/dto/users/login_response.dart';
import 'package:fashionapp/helpers/session.dart';
import 'package:fashionapp/views/signup_page.dart';
import 'package:fashionapp/widgets/loader.dart';
import 'package:fashionapp/widgets/logo.dart';
import 'package:fashionapp/widgets/my_button.dart';
import 'package:fashionapp/widgets/my_textfield.dart';
import 'package:fashionapp/widgets/output_message.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.session, required this.title});

  final String title;
  final Session session;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _ctlUsername = TextEditingController();
  final TextEditingController _ctlPassword = TextEditingController();

  bool _showLoader = false;
  bool _showError = false;
  String _loginMessage = "";

  void _resetPassword() {
    debugPrint("Reset Password");
  }

  void _signUp() {
     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignupPage(session: widget.session, title:"Registrati"),
        ),
      );
  }

  //Controllo che i campi siano compilati bene
  bool _checkFields() {
    //check username
    if (_ctlUsername.text.isEmpty) {
      setState(() {
        _loginMessage = "Lo username/email non può essere vuoto/a";
        _showError = true;
      });
      return false;
    }

    //check password
    if (_ctlPassword.text.isEmpty) {
      setState(() {
        _loginMessage = "La password non può essere vuota";
        _showError = true;
      });
      return false;
    }

    setState(() {
      _loginMessage = "";
      _showError = false;
    });
    return true;
  }

  //eseguo il login
  Future<void> login() async {
    //controllo i campi
    if (!_checkFields()) {
      return;
    }

    //faccio visualizzare il loader
    setState(() {
      _showLoader = true;
    });

    //await Future.delayed(const Duration(seconds: 2));
    //Provo a fare il login
    try {
      LoginResponse res = await widget.session.usersService.login(_ctlUsername.text, _ctlPassword.text);
      widget.session.accessToken = res.access_token;
      debugPrint("Login avvenuto, qui dobbiamo aprire la homepage");
      //TODO apertura homepage
    } catch(e) {
      //visualizzo errore login
      setState(() {
        _loginMessage = e.toString();
        _showError = true;
      });
    }

    setState(() {
      _showLoader = false;
    });

    debugPrint("finito");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              color: widget.session.backgroundColor,
              child: Center(child: body()),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Text(
                "v.${widget.session.appVersion}",
                style: GoogleFonts.roboto(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Container(
          height: 600,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Logo(width: 200),
              const SizedBox(height: 12),
              formLogin(),
            ],
          ),
        ),
      ],
    );
  }

  Widget formLogin() {
    return Container(
      padding: EdgeInsets.all(12),
      height: 300,
      child: Form(
        child: Column(
          children: [
            //Username
            MyTextfield(
              session: widget.session,
              controller: _ctlUsername,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Username/email',
              hintText: 'Inserisci username o email',
              prefixIcon: Icon(Icons.email),
            ),

            const SizedBox(height: 12),

            //Password
            MyTextfield(
              session: widget.session,
              controller: _ctlPassword,
              keyboardType: TextInputType.text,
              labelText: 'Password',
              hintText: 'Inserisci la tua password',
              prefixIcon: Icon(Icons.lock),
              obscureText: true,
            ),

            const SizedBox(height: 12),

            //pulsante login
            Visibility(
              visible: !_showLoader,
              replacement: Loader(session: widget.session, width: 40),
              child: MyButton(
                session: widget.session,
                label: 'Login',
                icon: Icons.check,
                onPressed: login,
              ),
            ),

            const SizedBox(height: 8),

            //errore login
            Visibility(
              visible: _showError,
              child: OutputMessage(
                type: "error",
                message: _loginMessage,
                showCloseButton: true,
                onClose: () {
                  setState(() {
                    _loginMessage = "";
                    _showError = false;
                  });
                },
              ),
            ),

            const SizedBox(height: 12),

            //Riga recupera password / registrati
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _resetPassword,
                  child: Text(
                    "Dimenticata la password?",
                    style: GoogleFonts.roboto(
                      color: widget.session.secondaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: _signUp,
                  child: Text(
                    "Crea un account",
                    style: GoogleFonts.roboto(
                      color: widget.session.secondaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
