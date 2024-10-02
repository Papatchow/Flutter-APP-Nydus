import "package:appteste/_comum/minhascores.dart";
import "package:appteste/_comum/my_snackbar.dart";
import "package:appteste/login/presentation/views/login_autenthication.dart";
import "package:appteste/login/presentation/views/login_decoration.dart";
import "package:flutter/material.dart";

class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  bool queroEntrar = true;
  bool recuperar = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _senhacontroller = TextEditingController();
  TextEditingController _nomecontroller = TextEditingController();

  ServiceAuthentication _serviceAut = ServiceAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.brancocinza,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 154, 214, 221),
                  MinhasCores.azulTopoGradiente
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "NydusRH",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Visibility(
                        visible: !recuperar,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailcontroller,
                              decoration:
                                  getAuthenticationInputDecoration("E-Mail"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O E-mail não pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "O e-mail é muito curto";
                                }
                                if (!value.contains("@")) {
                                  return "O e-mail não é válido";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _senhacontroller,
                              decoration:
                                  getAuthenticationInputDecoration("Senha"),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "A senha não pode ser vazia";
                                }
                                if (value.length < 3) {
                                  return "A senha é muito curta";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: recuperar,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: getAuthenticationInputDecoration(
                                    "Nova Senha"),
                                obscureText: true,
                                validator: (String? value) {
                                  if (value == null) {
                                    return "A nova senha não pode ser vazia";
                                  }
                                  if (value.length < 5) {
                                    return "A nova senha é muito curta";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                decoration: getAuthenticationInputDecoration(
                                    "Confirme a Nova Senha"),
                                obscureText: true,
                                validator: (String? value) {
                                  if (value == null) {
                                    return "A confirmação da senha não pode ser vazia";
                                  }
                                  if (value.length < 5) {
                                    return "A confirmação de senha é muito curta";
                                  }
                                  return null;
                                },
                              )
                            ],
                          )),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAuthenticationInputDecoration(
                                  "Confirme a Senha"),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "A confirmação de senha não pode ser vazia";
                                }
                                if (value.length < 5) {
                                  return "A confirmação de senha é muito curta";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _nomecontroller,
                              decoration:
                                  getAuthenticationInputDecoration("Nome"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não pode ser vazio";
                                }
                                if (value.length < 3) {
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          botaoprincipalClicado();
                        },
                        child: Text(
                          (queroEntrar) ? "Entrar" : "Cadastrar",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Divider(),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              recuperar = !recuperar;
                            });
                          },
                          child: Text(
                            (recuperar) ? "Fazer Login" : "Esqueci a Senha",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ),
                      Divider(),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              queroEntrar = !queroEntrar;
                            });
                          },
                          child: Text(
                            (queroEntrar)
                                ? "Não tem conta? Cadastre-se!"
                                : "Já tem uma conta? Entre!",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          )),
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

  botaoprincipalClicado() {
    String nome = _nomecontroller.text;
    String email = _emailcontroller.text;
    String senha = _senhacontroller.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada Validada");
      } else {
        print("Cadastro Validado");
        print(
            "${_emailcontroller.text}, ${_senhacontroller.text}, ${_nomecontroller.text}");
        _serviceAut
            .cadastrarUsuario(nome: nome, senha: senha, email: email)
            .then((String? erro) {

          if (erro != null) {
            showSnackBar(context: context, texto: erro);
          } else {
            showSnackBar(context: context, texto: "Cadastro efetuado com sucesso", 
            isErro: false);
          }
        });
      }
    } else {
      print("Form inválido");
    }
  }
}
