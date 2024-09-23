import "package:appteste/_comum/minhascores.dart";
import "package:flutter/material.dart";

class Tela4 extends StatelessWidget {
  const Tela4({super.key});

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
                  MinhasCores.azulBaixoGradiente,
                  MinhasCores.azulTopoGradiente
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 170),
              Image.asset(
                "assets/images/QRcode.png",
                height: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                "Escaneie o seu QRCode",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Acesse a plataforma no seu computador e faça a leitura do seu QRCode único. Essa é uma importante medida de segurança para os seus dados",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
