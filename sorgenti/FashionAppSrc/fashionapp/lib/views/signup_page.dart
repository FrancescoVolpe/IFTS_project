import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fashionapp/dto/users/signup_post.dart';
import 'package:fashionapp/helpers/session.dart';
import 'package:fashionapp/widgets/loader.dart';
import 'package:fashionapp/widgets/logo.dart';
import 'package:fashionapp/widgets/my_button.dart';
import 'package:fashionapp/widgets/my_h1.dart';
import 'package:fashionapp/widgets/my_textfield.dart';
import 'package:fashionapp/widgets/output_message.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.session, required this.title});

  final Session session;
  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController _ctlUsername = TextEditingController();
  final TextEditingController _ctlPassword = TextEditingController();
  final TextEditingController _ctlCheckPassword = TextEditingController();
  final TextEditingController _ctlFirstName = TextEditingController();
  final TextEditingController _ctlLastName = TextEditingController();

  bool _showLoader = false;
  bool _showError = false;
  String _errorMessage = "";

  int _step = 1;

  void cancelSignUp() {
    Navigator.pop(context);
  }

  bool _checkFields() {
    //email vuota
    if (_ctlUsername.text.isEmpty) {
      setState(() {
        _errorMessage = "Inserire un'email valida";
        _showError = true;
      });
      return false;
    }

    //password vuota
    if (_ctlPassword.text.isEmpty) {
      setState(() {
        _errorMessage = "Inserire una password valida";
        _showError = true;
      });
      return false;
    }

    //confirm != da password
    if (_ctlPassword.text != _ctlCheckPassword.text) {
      setState(() {
        _errorMessage = "Le due password devono coincidere";
        _showError = true;
      });
      return false;
    }

    //nome vuoto
    if (_ctlFirstName.text.isEmpty) {
      setState(() {
        _errorMessage = "Il nome è obbligatorio";
        _showError = true;
      });
      return false;
    }

    //cognome vuoto
    if (_ctlLastName.text.isEmpty) {
      setState(() {
        _errorMessage = "Il cognome è obbligatorio";
        _showError = true;
      });
      return false;
    }

    return true;
  }

  Future<void> signUp() async {
    //nascondo errore preventivamente
    setState(() {
      _showError = false;
      _errorMessage = "";
    });

    //check campi
    if (!_checkFields()) {
      return;
    }

    //visualizza loader
    setState(() {
      _showLoader = true;
    });
    
    //chiamata API
    //await Future.delayed(const Duration(seconds: 2));
    try {
      
      SignupPost toPost = SignupPost(
        email: _ctlUsername.text, 
        password: _ctlPassword.text, 
        firstName: _ctlFirstName.text, 
        lastName: _ctlLastName.text,
      );

      await widget.session.usersService.signup(toPost);
      setState(() {
        _step = 2;
      });

    } catch(e) {
      //visualizza errore se c'è
      setState(() {
        _errorMessage = e.toString();
        _showError = true;
      });
    }

    //nasconde loader
    setState(() {
      _showLoader = false;
    });
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
              child: Center(
                child: _step == 1 ? body() : step2(),
              ),
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
          height: 700,
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
              const SizedBox(height: 6),
              MyH1(text: "CREA IL TUO ACCOUNT"),
              const SizedBox(height: 6),
              formLogin(),
            ],
          ),
        ),
      ],
    );
  }

  Widget step2() {
    return Column(
      children: [
        Container(
          height: 700,
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
              const SizedBox(height: 6),
              MyH1(text: "CONFERMA REGISTRAZIONE"),
              const SizedBox(height: 6),
              formPincode(),
            ],
          ),
        ),
      ],
    );
  }

  Widget formPincode() {
    return Container(
      padding: EdgeInsets.all(12),
      height: 475,
      child: Form(
        child: Column(
          children: [
            MyButton(
              session: widget.session,
              label: 'Indietro',
              icon: Icons.arrow_back,
              onPressed: () {
                setState(() {
                  _step = 1;
                });
              },
              type: "cancel",
            ),
          ],
        ),
      ),
    );
  }

  Widget formLogin() {
    return Container(
      padding: EdgeInsets.all(12),
      height: 475,
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

            const SizedBox(height: 10),

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

             const SizedBox(height: 10),

            //Check Password
            MyTextfield(
              session: widget.session,
              controller: _ctlCheckPassword,
              keyboardType: TextInputType.text,
              labelText: 'Controllo Password',
              hintText: 'Inserisci di nuovo la password',
              prefixIcon: Icon(Icons.lock),
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //firstname
            MyTextfield(
              session: widget.session,
              controller: _ctlFirstName,
              keyboardType: TextInputType.text,
              labelText: 'Nome',
              hintText: 'Inserisci il tuo nome',
              prefixIcon: Icon(Icons.person),
            ),

            const SizedBox(height: 10),

            //lastname
             MyTextfield(
              session: widget.session,
              controller: _ctlLastName,
              keyboardType: TextInputType.text,
              labelText: 'Cognome',
              hintText: 'Inserisci il tuo cognome',
              prefixIcon: Icon(Icons.person),
            ),

            const SizedBox(height: 10),

            //pulsanti annulla + registrati
            Visibility(
              visible: !_showLoader,
              replacement: Loader(session: widget.session, width: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(
                    session: widget.session,
                    label: 'Annulla',
                    icon: Icons.cancel,
                    onPressed: cancelSignUp,
                    type: "cancel",
                  ),
                  MyButton(
                    session: widget.session,
                    label: 'Registrati',
                    icon: Icons.check,
                    onPressed: signUp,
                  ),
                ],
              ),
            ),

            const SizedBox(height:12),

            // box messaggio errore
            Visibility(
              visible: _showError,
              child: OutputMessage(type: "error", message: _errorMessage),
            ),
          ],
        ),
      ),
    );
  }
}