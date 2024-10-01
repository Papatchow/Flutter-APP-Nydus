import "package:appteste/_comum/minhascores.dart";
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
                              decoration: getAuthenticationInputDecoration("E-Mail"),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: getAuthenticationInputDecoration("Senha"),
                              obscureText: true,
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
                              decoration: getAuthenticationInputDecoration("Nova Senha"),
                              obscureText: true,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration:getAuthenticationInputDecoration("Confirme a Nova Senha"),
                            obscureText: true,
                          )
                          ],)
                      ),
                      const SizedBox(height: 8),

                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAuthenticationInputDecoration(
                                  "Confirme a Senha"),
                              obscureText: true,
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration:
                                  getAuthenticationInputDecoration("Nome"),
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
                        onPressed: () {},
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
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
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
                            (queroEntrar) ? "Não tem conta? Cadastre-se!": "Já tem uma conta? Entre!",
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),)),
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
}
