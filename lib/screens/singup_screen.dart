import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/utils/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SingupScreen extends StatefulWidget {
  @override
  _SingupScreenState createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> with DefaultWidgets {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(title: 'Cadastro'),
        body: ScopedModelDescendant<UserModel>(builder: (context, child, user) {
          if (user.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) return 'Nome Invalido';
                  },
                  decoration: InputDecoration(hintText: "Nome Completo"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (text) {
                    if (!EmailValidator.validate(text))
                      return 'E-mail Invalido';
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
                        if (_formKey.currentState.validate()) {
                          Map<String, dynamic> userData = {
                            'name': _nameController.text,
                            'email': _emailController.text,
                            'admin': false,
                          };
                          user.singUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
                        }
                      },
                    ))
              ],
            ),
          );
        }));
  }

  void _onSuccess() {}
  void _onFail() {}
}
