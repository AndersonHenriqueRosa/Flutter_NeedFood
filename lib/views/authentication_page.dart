import 'package:flutter/material.dart';
import 'package:need_food/common/my_snackbar.dart';
import 'package:need_food/components/authentication_fiel_decoration.dart';
import 'package:need_food/services/authentication_service.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool login = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailControlle = TextEditingController();
  TextEditingController _passwordControlle = TextEditingController();
  TextEditingController _usernameControlle = TextEditingController();
  TextEditingController _phoneControlle = TextEditingController();
  TextEditingController _addressControlle = TextEditingController();
  AuthenticationService _authenticationService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/img/burger.png", height:100),
                      const Text(
                        "Need-Food",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 32,
                      ),
                      Visibility(
                          visible: login, 
                          child: Column(
                            children: [
                      TextFormField(
                        controller: _emailControlle,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null) {
                            return "*O e-mail não  pode ser vazio";
                          }
                          if (value.length < 8) {
                            return "*O e-mail é muito curto";
                          }
                          if (!value.contains("@")) {
                            return "*O e-mail não é valido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordControlle,
                        decoration: getAuthenticationInputDecoration("Password"),
                          obscureText: true,
                          validator: (String? value) {
                                  if (value == null) {
                                    return "*A senha não  pode ser vazia";
                                  }
                                  if (value.length < 5) {
                                    return "*A senha é muito curta";
                                  }
                                  return null;
                                },
                          ),
                          ],
                            ),
                        ),
                      
                        Visibility(
                          visible: !login, 
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _usernameControlle,
                                  decoration: getAuthenticationInputDecoration("Username"),
                                  validator: (String? value) {
                                  if (value == null) {
                                    return "*O nome não  pode ser vazio";
                                  }
                                  if (value.length < 2) {
                                    return "*O nome é muito curto";
                                  }
                                  return null;
                                },
                                ),
                                const SizedBox(height: 8),
                              TextFormField(
                                controller: _emailControlle,
                                  decoration: getAuthenticationInputDecoration("E-mail"),
                                  validator: (String? value) {
                                    if (value == null) {
                                      return "*O e-mail não  pode ser vazio";
                                    }
                                    if (value.length < 8) {
                                      return "*O e-mail é muito curto";
                                    }
                                    if (!value.contains("@")) {
                                      return "*O e-mail não é valido";
                                    }
                                    return null;
                                  },
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _phoneControlle,
                                  decoration: getAuthenticationInputDecoration("Phone"),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: _addressControlle,
                                  decoration: getAuthenticationInputDecoration("Address"),
                                ),
                                const SizedBox(height: 8),
                              TextFormField(
                                controller: _passwordControlle,
                                decoration: getAuthenticationInputDecoration("Password"),
                                obscureText: true,
                                validator: (String? value) {
                                  if (value == null) {
                                    return "*A senha não  pode ser vazia";
                                  }
                                  if (value.length < 5) {
                                    return "*A senha é muito curta";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                decoration: getAuthenticationInputDecoration("Confirm Password"),
                                obscureText: true,
                                validator: (String? value) {
                                  if (value == null) {
                                    return "*A confirmação de senha não  pode ser vazia";
                                  }
                                  if (value.length < 5) {
                                    return "*A confirmação de senha é muito curta";
                                  }
                                  return null;
                                },
                              ), 
                            ],
                            ),
                            ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            authenticationButon();
                          },
                           child: Text((login)?"Login" : "Register"),
                        ),
                        TextButton(onPressed: () {
                          setState(() {
                            login = !login;
                          });
                        },
                         child: 
                           Text((login)?"No account yet?" : "Have an account? "),
                          ),
                      ],
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  authenticationButon() {
    String username = _usernameControlle.text;
    String email = _emailControlle.text;
    String phone = _phoneControlle.text;
    String address = _addressControlle.text;
    String password = _passwordControlle.text;

    if (_formKey.currentState!.validate()) {
      if (login) {
        print("Login Validado");
        _authenticationService.loginUser(email: email, password: password).then(
          (String? erro) {
          if (erro != null ){
            showSnackBar(context: context, text: erro);
          }
        },
        );
      } else {
        print("Resgistro Validado");
        print("${_usernameControlle.text}, ${_emailControlle.text}, ${_phoneControlle.text}, ${_addressControlle.text}, ${_passwordControlle.text},");
        _authenticationService
        .registerUser(username: username, email: email, phone: phone, address: address, password: password)
        .then(
          (String? erro) {
            
            if (erro != null) {
              //Voltou com erro
              showSnackBar(context: context, text: erro);
            }
          },
        );
      }
    } else {
      print("Form inválido");
    }
  }
}