import 'package:flutter/material.dart';

class Bienvenida extends StatefulWidget {
  const Bienvenida({Key? key}) : super(key: key);

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  List imagenes = [
    "desktop/PORCI11.gif",
    "desktop/PORCI22.gif",
    "desktop/PORCI33.gif"
  ];

  PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Cambiar a la siguiente imagen al tocar la pantalla
          setState(() {
            currentPageIndex = (currentPageIndex + 1) % imagenes.length;
            _pageController.animateToPage(
              currentPageIndex,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: imagenes.length,
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5 * fem),
                image: DecorationImage(
                  image: AssetImage("img/" + imagenes[index]),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 350,
                          height: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 100),
                                width: 40,
                                height: 60,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(3, (indexDots) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Cambiar a la imagen correspondiente al dot tocado
                                        setState(() {
                                          currentPageIndex = indexDots;
                                          _pageController.animateToPage(
                                            currentPageIndex,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeInOut,
                                          );
                                        });
                                      },
                                      child: Container(
                                        width: 8,
                                        height: index == indexDots ? 25 : 8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Bienvenida2 extends StatefulWidget {
  const Bienvenida2({Key? key}) : super(key: key);

  @override
  State<Bienvenida2> createState() => _Bienvenida2State();
}

class _Bienvenida2State extends State<Bienvenida2> {
  List imagenes = [
    "desktop/PORCI33.gif",
    "desktop/PORCI11.gif",
    "desktop/PORCI22.gif",
  ];

  PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Cambiar a la siguiente imagen al tocar la pantalla
          setState(() {
            currentPageIndex = (currentPageIndex + 1) % imagenes.length;
            _pageController.animateToPage(
              currentPageIndex,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: imagenes.length,
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5 * fem),
                image: DecorationImage(
                  image: AssetImage("img/" + imagenes[index]),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 350,
                          height: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 100),
                                width: 40,
                                height: 60,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(3, (indexDots) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Cambiar a la imagen correspondiente al dot tocado
                                        setState(() {
                                          currentPageIndex = indexDots;
                                          _pageController.animateToPage(
                                            currentPageIndex,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeInOut,
                                          );
                                        });
                                      },
                                      child: Container(
                                        width: 8,
                                        height: index == indexDots ? 25 : 8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
