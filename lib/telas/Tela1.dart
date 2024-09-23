import "package:flutter/material.dart";
import "package:appteste/_comum/minhascores.dart";

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

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
                "assets/images/Userlogo.png",
                height: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                "Bem-vindo ao NydusRH!",
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
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec tellus urna. Nam eleifend id justo in sodales. In massa lorem, iaculis vitae imperdiet id, viverra a metus. Ut euismod sodales elit quis imperdiet. In vehicula leo nec dolor dapibus, sed condimentum ligula rhoncus.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
