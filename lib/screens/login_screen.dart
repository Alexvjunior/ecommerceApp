import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/singup_screen.dart';
import 'package:ecommerce/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget with DefaultWidgets {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                      model.signIn();
                    },
                  ))
            ],
          ),
        );
      }),
    );
  }
}
