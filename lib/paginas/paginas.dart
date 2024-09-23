import "package:appteste/telas/Tela1.dart";
import "package:appteste/telas/Tela2.dart";
import "package:appteste/telas/Tela3.dart";
import "package:appteste/telas/Tela4.dart";
import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class slider extends StatefulWidget {
  const slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  int paginaAtual = 0;
  late PageController controladora;

  @override
  void initState() {
    super.initState();
    controladora = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controladora,
            onPageChanged: (index) {
              setState(() {
                paginaAtual = index;
              });
            },
            children: const [
              Tela1(),
              Tela2(),
              Tela3(),
              Tela4(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: SmoothPageIndicator(
                controller: controladora,
                count: 4,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.blue,
                ),
                onDotClicked: (index) {
                  controladora.animateToPage(
                    index, 
                    duration: const Duration(milliseconds: 300), 
                    curve: Curves.easeInOut,);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (paginaAtual < 3) {
                      controladora.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
                  },
                  child: const Text(
                    "Próximo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
