import 'package:ecommerce/utils/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SingupScreen extends StatelessWidget with DefaultWidgets {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'Cadastro'),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty)
                  return 'Nome Invalido';
              },
              decoration: InputDecoration(hintText: "Nome Completo"),
            ),
             SizedBox(
              height: 16,
            ),
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
            SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 50,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Criar Conta',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                  },
                ))
          ],
        ),
      ),
    );
  }
}
