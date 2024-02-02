import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileSplash;
  final Widget tabletSplash;
  final Widget desktopSplash;

  const ResponsiveLayout({
    super.key,
    required this.mobileSplash,
    required this.tabletSplash,
    required this.desktopSplash,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileSplash;
        } else if (constraints.maxWidth < 1100) {
          return tabletSplash;
        } else {
          return desktopSplash;
        }
      },
    );
  }
}


class responsiveinicio extends StatelessWidget {
  final Widget iniciomobil;
  final Widget iniciotablet;
  final Widget iniciodesktop;

  const responsiveinicio({
    super.key,
    required this.iniciomobil,
    required this.iniciotablet,
    required this.iniciodesktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return iniciomobil;
        } else if (constraints.maxWidth < 1100) {
          return iniciotablet;
        } else {
          return iniciodesktop;
        }
      },
    );
  }
}

class responsivesesion extends StatelessWidget {
  final Widget sesionmobil;
  final Widget sesiontablet;
  final Widget sesiondesktop;

  const responsivesesion({
    super.key,
    required this.sesionmobil,
    required this.sesiontablet,
    required this.sesiondesktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return sesionmobil;
        } else if (constraints.maxWidth < 1100) {
          return sesiontablet;
        } else {
          return sesiondesktop;
        }
      },
    );
  }
}

class responsiveregistro extends StatelessWidget {
  final Widget registromobil;
  final Widget registrotablet;
  final Widget registrodesktop;

  const responsiveregistro({
    super.key,
    required this.registromobil,
    required this.registrotablet,
    required this.registrodesktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return registromobil;
        } else if (constraints.maxWidth < 1100) {
          return registrotablet;
        } else {
          return registrodesktop;
        }
      },
    );
  }
}

class responsivehome extends StatelessWidget {
  final Widget homemobil;
  final Widget hometablet;
  final Widget homedesktop;

  const responsivehome({
    super.key,
    required this.homemobil,
    required this.hometablet,
    required this.homedesktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return homemobil;
        } else if (constraints.maxWidth < 1100) {
          return hometablet;
        } else {
          return homedesktop;
        }
      },
    );
  }
}


class responsivenotifi extends StatelessWidget {
  final Widget notifimobil;
  final Widget notifitablet;
  final Widget homedesktop;

  const responsivenotifi({
    super.key,
    required this.notifimobil,
    required this.notifitablet,
    required this.homedesktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return notifimobil;
        } else if (constraints.maxWidth < 1100) {
          return notifitablet;
        } else {
          return homedesktop;
        }
      },
    );
  }
}