import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/singup_screen.dart';
import 'package:ecommerce/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with DefaultWidgets {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Login'), centerTitle: true, actions: <Widget>[
        FlatButton(
          child: Text(
            'CRIAR CONTA',
            style: TextStyle(fontSize: 15),
          ),
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SingupScreen()));
          },
        )
      ]),
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                validator: (text) {
                  if (!EmailValidator.validate(text)) return 'E-mail Invalido';
                },
                decoration: InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _passController,
                validator: (text) {
                  if (text == null || text.isEmpty || text.length < 6)
                    return 'Senha invalida';
                },
                decoration: InputDecoration(hintText: "Senha"),
                obscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    'Esqueci minha Senha',
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 50,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}

                      model.signIn(
                        email: _emailController.text,
                        pass: _passController.text,
                        onSuccess: _onSuccess,
                        onFail: onFail,
                      );
                    },
                  ))
            ],
          ),
        );
      }),
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao Entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
    ));
  }
}
