import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/mobil/inicio/inicio.dart';
import 'package:myapp/responsive/responsive_layout.dart';
import 'package:myapp/services/firebase_service.dart';
import 'package:myapp/services/notifica_service.dart';
import 'package:myapp/tablet/inicio/inicio.dart';
import 'package:myapp/tablet/inicio/registro.dart';
import 'package:myapp/tablet/splash/splash_tablet.dart';
import 'package:myapp/tablet/usuario/home.dart';
import 'package:myapp/tablet/usuario/notificaciones.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'desktop/inicio/inicio.dart';
import 'desktop/inicio/registro.dart';
import 'desktop/inicio/sesion.dart';
import 'desktop/splash/splash_desktop.dart';
import 'desktop/usuario/home.dart';
import 'mobil/inicio/registro.dart';
import 'mobil/splash/splash_mobil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:myapp/mobil/inicio/sesion.dart';
import 'package:myapp/tablet/inicio/sesion.dart';

import 'mobil/usuario/home.dart';
import 'mobil/usuario/notificacion.dart';



void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

	// Verificar si hay una sesión iniciada
	SharedPreferences prefs = await SharedPreferences.getInstance();
	bool isLogged = prefs.getBool('isLogged') ?? false;


	print("isLogged: $isLogged");

	runApp(MyApp(isLogged: isLogged));
}


class FlutterStatusbarcolor {
}

class MyApp extends StatelessWidget {
	final bool isLogged;

	const MyApp({Key? key, required this.isLogged}) : super(key: key);

	@override
	Widget build (BuildContext context) {

				MaterialColor mycolor = MaterialColor(Color.fromRGBO(229, 203, 206, 1).value, <int, Color>{
			50: Color.fromRGBO(229, 203, 206, 0.1),
			100: Color.fromRGBO(229, 203, 206, 0.2),
			200: Color.fromRGBO(229, 203, 206, 0.3),
			300: Color.fromRGBO(229, 203, 206, 0.4),
			400: Color.fromRGBO(229, 203, 206, 0.5),
			500: Color.fromRGBO(229, 203, 206, 0.6),
			600: Color.fromRGBO(229, 203, 206, 0.7),
			700: Color.fromRGBO(229, 203, 206, 0.8),
			800: Color.fromRGBO(229, 203, 206, 0.9),
			900: Color.fromRGBO(229, 203, 206, 1),
		},
		);

		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: ThemeData(primarySwatch: mycolor),
			home: isLogged
					? homes()  // Si está iniciado, muestra la pantalla homes
					: ResponsiveLayout(
				mobileSplash: SplashMobil(),
				tabletSplash: SplashTablet(),
				desktopSplash: SplashDesktop(),
			),
		);

	}
}


class iniciomain extends StatelessWidget {
  const iniciomain({super.key});

  @override
  Widget build(BuildContext context) {

		MaterialColor mycolor = MaterialColor(Color.fromRGBO(229, 203, 206, 1).value, <int, Color>{
			50: Color.fromRGBO(229, 203, 206, 0.1),
			100: Color.fromRGBO(229, 203, 206, 0.2),
			200: Color.fromRGBO(229, 203, 206, 0.3),
			300: Color.fromRGBO(229, 203, 206, 0.4),
			400: Color.fromRGBO(229, 203, 206, 0.5),
			500: Color.fromRGBO(229, 203, 206, 0.6),
			600: Color.fromRGBO(229, 203, 206, 0.7),
			700: Color.fromRGBO(229, 203, 206, 0.8),
			800: Color.fromRGBO(229, 203, 206, 0.9),
			900: Color.fromRGBO(229, 203, 206, 1),
		},
		);

		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: ThemeData(primarySwatch: mycolor),
			home: responsiveinicio(
				iniciomobil: inicio_mobil(),
				iniciotablet: inicio_tablet(),
				iniciodesktop: inicio_desktop(),
			),
		);
  }
}


class sesiones extends StatelessWidget {
	const sesiones({super.key});

	@override
	Widget build(BuildContext context) {

		MaterialColor mycolor = MaterialColor(Color.fromRGBO(229, 203, 206, 1).value, <int, Color>{
			50: Color.fromRGBO(229, 203, 206, 0.1),
			100: Color.fromRGBO(229, 203, 206, 0.2),
			200: Color.fromRGBO(229, 203, 206, 0.3),
			300: Color.fromRGBO(229, 203, 206, 0.4),
			400: Color.fromRGBO(229, 203, 206, 0.5),
			500: Color.fromRGBO(229, 203, 206, 0.6),
			600: Color.fromRGBO(229, 203, 206, 0.7),
			700: Color.fromRGBO(229, 203, 206, 0.8),
			800: Color.fromRGBO(229, 203, 206, 0.9),
			900: Color.fromRGBO(229, 203, 206, 1),
		},
		);

		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: ThemeData(primarySwatch: mycolor),
			home: responsivesesion(
				sesionmobil: sesion_mobil(),
				sesiontablet: sesiontablet(),
				sesiondesktop: sesion_deskt(),
			),
		);
	}
}

class registros extends StatelessWidget {
	const registros({super.key});

	@override
	Widget build(BuildContext context) {

		MaterialColor mycolor = MaterialColor(Color.fromRGBO(229, 203, 206, 1).value, <int, Color>{
			50: Color.fromRGBO(229, 203, 206, 0.1),
			100: Color.fromRGBO(229, 203, 206, 0.2),
			200: Color.fromRGBO(229, 203, 206, 0.3),
			300: Color.fromRGBO(229, 203, 206, 0.4),
			400: Color.fromRGBO(229, 203, 206, 0.5),
			500: Color.fromRGBO(229, 203, 206, 0.6),
			600: Color.fromRGBO(229, 203, 206, 0.7),
			700: Color.fromRGBO(229, 203, 206, 0.8),
			800: Color.fromRGBO(229, 203, 206, 0.9),
			900: Color.fromRGBO(229, 203, 206, 1),
		},
		);

		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: ThemeData(primarySwatch: mycolor),
			home: responsiveregistro(
				registromobil: registro_mobil(),
				registrotablet: registablet(),
				registrodesktop: regis_desk(),
			),
		);
	}
}

class homes extends StatelessWidget {
	const homes({super.key});

	@override
	Widget build(BuildContext context) {

		MaterialColor mycolor = MaterialColor(Color.fromRGBO(229, 203, 206, 1).value, <int, Color>{
			50: Color.fromRGBO(229, 203, 206, 0.1),
			100: Color.fromRGBO(229, 203, 206, 0.2),
			200: Color.fromRGBO(229, 203, 206, 0.3),
			300: Color.fromRGBO(229, 203, 206, 0.4),
			400: Color.fromRGBO(229, 203, 206, 0.5),
			500: Color.fromRGBO(229, 203, 206, 0.6),
			600: Color.fromRGBO(229, 203, 206, 0.7),
			700: Color.fromRGBO(229, 203, 206, 0.8),
			800: Color.fromRGBO(229, 203, 206, 0.9),
			900: Color.fromRGBO(229, 203, 206, 1),
		},
		);

		return MaterialApp(
			debugShowCheckedModeBanner: false,
			themeMode: ThemeMode.light,
			theme: ThemeData(primarySwatch: mycolor),
			home: responsivehome(
				homemobil: homemobil(),
				hometablet: hometablet(),
				homedesktop: home_desk(),
			),
		);
	}
}


class notifi extends StatelessWidget {
	const notifi({super.key});

	@override
	Widget build(BuildContext context) {

		MaterialColor mycolor = MaterialColor(Color.fromRGBO(229, 203, 206, 1).value, <int, Color>{
			50: Color.fromRGBO(229, 203, 206, 0.1),
			100: Color.fromRGBO(229, 203, 206, 0.2),
			200: Color.fromRGBO(229, 203, 206, 0.3),
			300: Color.fromRGBO(229, 203, 206, 0.4),
			400: Color.fromRGBO(229, 203, 206, 0.5),
			500: Color.fromRGBO(229, 203, 206, 0.6),
			600: Color.fromRGBO(229, 203, 206, 0.7),
			700: Color.fromRGBO(229, 203, 206, 0.8),
			800: Color.fromRGBO(229, 203, 206, 0.9),
			900: Color.fromRGBO(229, 203, 206, 1),
		},
		);

		return MaterialApp(
			debugShowCheckedModeBanner: false,
			themeMode: ThemeMode.light,
			theme: ThemeData(primarySwatch: mycolor),
			home: responsivehome(
				homemobil: notificacion(),
				hometablet: notifi_tablet(),
				homedesktop: home_desk(),
			),
		);
	}
}