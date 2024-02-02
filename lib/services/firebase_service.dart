import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../desktop/usuario/cerditos/registros/registro3.dart';
import '../main.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> registerUser(String email, String password) async {
  try {
    if (email.endsWith('sena.edu.co')) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Registro exitoso');
      // Puedes navegar a la siguiente pantalla después del registro exitoso
    } else {
      print('El correo electrónico debe terminar en sena.edu.co');
    }
  } catch (e) {
    print('Error de registro: $e');
  }
}

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> getUserEmail() async {
    String? email;

    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // El usuario está autenticado, obtén su correo electrónico
        email = user.email;
      } else {
        // No hay usuario autenticado
        print('No hay usuario autenticado');
      }
    } catch (e) {
      print('Error al obtener el correo electrónico: $e');
    }

    return email;
  }
}

/*class Auth{
  final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password
    );
  }
}  */

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Guarda el estado de inicio de sesión como verdadero utilizando Shared Preferences o cualquier otra solución de persistencia.
      await AuthManager.setLoggedIn(true);
    } catch (e) {
      print('Error al iniciar sesión: $e');
    }
  }

}

class AuthManager {
  static const String loggedInKey = 'loggedIn';

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, value);
  }
}



Future<void> addRegistroHembra(int id, String nombre, DateTime fechaIngreso, DateTime fechaNacimiento, String peso, int pesones, int camadas, BuildContext context) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('registro_hembra');

  try {
    QuerySnapshot query = await collectionReference.where('id', isEqualTo: id).get();

    if (query.docs.isNotEmpty) {
      print('Error: Ya existe una hembra con el ID $id');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('YA EXISTE UNA HEMBRA CON ESE ID'),
        ),
      );
    } else {
      // No existe un registro con el mismo ID, se puede agregar
      await collectionReference.add({
        'id': id,
        'nombre': nombre,
        'fecha_ingreso': fechaIngreso,
        'fecha_nacimiento': fechaNacimiento,
        'peso': peso,
        'pesones': pesones,
        'camadas': camadas,
      });

      print('Hembra registrada correctamente.');
    }
  } catch (e) {
    print('Error al registrar la hembra: $e');
  }
}


/*void signOutAndRedirectToLogin(BuildContext context) async {
  try {
    await _auth.signOut();
    print('Sesión cerrada exitosamente');

    // Redireccionar a la página de inicio de sesión después de cerrar sesión
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => sesion_deskt()),
          (Route<dynamic> route) => false, // Esto evita que el usuario pueda volver atrás después de cerrar sesión
    );
  } catch (e) {
    print('Error al cerrar sesión: $e');
    // Manejar el error si ocurre al cerrar sesión
  }
} */

void signOutAndRedirectToLogin(BuildContext context) async {
  try {
    await _auth.signOut();
    print('Sesión cerrada exitosamente');

    // Eliminar la información de inicio de sesión al cerrar sesión.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLogged');

    // Redireccionar a la página de inicio de sesión después de cerrar sesión.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => iniciomain()),
          (Route<dynamic> route) => false,
    );
  } catch (e) {
    print('Error al cerrar sesión: $e');
  }
}



Future<void> addRegistroMacho(int id_macho, String nombre, DateTime fechaIngreso, DateTime fechaNacimiento, String peso, BuildContext context) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('registro_macho');

  try {
    QuerySnapshot query = await collectionReference.where('id_macho', isEqualTo: id_macho).get();

    if (query.docs.isNotEmpty) {
      print('Error: Ya existe una macho con el ID $id_macho');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('YA EXISTE UN MACHO CON ESE ID'),
        ),
      );
    } else {
      await collectionReference.add({
        'id_macho': id_macho,
        'nombre': nombre,
        'fecha_ingreso': fechaIngreso,
        'fecha_nacimiento': fechaNacimiento,
        'peso': peso,
      });
      print('Macho registrado correctamente.');
    }
  } catch (e) {
    print('Error al registrar el macho: $e');
  }

}

Future<void> addRegistroVacuna(int id_hembra, String nombre_vacuna,String nombre_hembra, DateTime fecha_vacunacion,String estado) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('vacunahembras');

  try {
    await collectionReference.add({
      'id_hembra': id_hembra,
      'nombre_vacuna': nombre_vacuna,
      'nombre_hembra': nombre_hembra,
      'fecha_vacunacion': fecha_vacunacion,
      'estado': estado,
    });

    print('vacuna registrada correctamente.');
  } catch (e) {
    print('Error al registrar la vacuna: $e');
  }

}

Future<void> addRegistroAreapartos(DateTime fechaParto, int idHembra, int idParidera, double kgDia, String nombre, int numeroLechones, int numeroRaciones, double totalSemana) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('areapartos');

  try {
    await collectionReference.add({
      'fecha_parto': fechaParto,
      'id_hembra': idHembra,
      'id_paridera': idParidera,
      'kg_dia': kgDia,
      'nombre': nombre,
      'numero_lechones': numeroLechones,
      'numero_raciones': numeroRaciones,
      'total_semana': totalSemana,
    });

    print('Datos registrados correctamente en Firebase.');
  } catch (e) {
    print('Error al registrar los datos en Firebase: $e');
  }
}

Future<void> addRegistroAreagestacion(String estado, int idHembra, int idParidera, double kgDia, String nombre, String concentrado, int numeroRaciones, double totalSemana) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('areagestacion');

  try {
    await collectionReference.add({
      'estado': estado,
      'id_hembra': idHembra,
      'id_paridera': idParidera,
      'kg_dia': kgDia,
      'nombre': nombre,
      'concentrado': concentrado,
      'numero_raciones': numeroRaciones,
      'total_semana': totalSemana,
    });

    print('Datos registrados correctamente en Firebase.');
  } catch (e) {
    print('Error al registrar los datos en Firebase: $e');
  }
}

Future<void> addRegistroAreamacho(String peso, int idHembra, int idParidera, double kgDia, String nombre, String concentrado, int numeroRaciones, double totalSemana) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('areamacho');

  try {
    await collectionReference.add({
      'peso': peso,
      'id_hembra': idHembra,
      'id_paridera': idParidera,
      'kg_dia': kgDia,
      'nombre': nombre,
      'concentrado': concentrado,
      'numero_raciones': numeroRaciones,
      'total_semana': totalSemana,
    });

    print('Datos registrados correctamente en Firebase.');
  } catch (e) {
    print('Error al registrar los datos en Firebase: $e');
  }
}

Future<void> addRegistroArealechones(int edad, int total_animales, int idParidera, double kgDia, double consumo_dia, String concentrado, int numeroRaciones, double totalSemana) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('arealechones');

  try {
    await collectionReference.add({
      'edad': edad,
      'total_animales': total_animales,
      'id_paridera': idParidera,
      'kg_dia': kgDia,
      'consumo_dia': consumo_dia,
      'concentrado': concentrado,
      'numero_raciones': numeroRaciones,
      'total_semana': totalSemana,
    });

    print('Datos registrados correctamente en Firebase.');
  } catch (e) {
    print('Error al registrar los datos en Firebase: $e');
  }
}

Future<void> addRegistroAlimento(String mes, String casa_comercial, String producto, int dia, double entra,double sale,double saldo) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('inventario_alimentacion');

  try {
    await collectionReference.add({
      'mes': mes,
      'casa_comercial': casa_comercial,
      'producto': producto,
      'dia': dia,
      'entra': entra,
      'sale': sale,
      'saldo': saldo,
    });

    print('alimento registrado correctamente.');
  } catch (e) {
    print('Error al registrar el alimento: $e');
  }

}

Future<void> addRegistroHojadevida(
    int id_hembra,
    int id_parto,
    int id_macho,
    DateTime fecha_monta,
    DateTime fecha_destete,
    DateTime fecha_celo,
    DateTime fecha_parto,
    DateTime ingreso_paridera,
    DateTime real_parto,
    String duracion_parto,
    int total_nacidos,
    int nacidos_vivos,
    int nacidos_muertos,
    int momias,
    DateTime fecha_destetecrias,
    int destetados,
    BuildContext context,
    ) async {
  CollectionReference hojaDeVidaCollection = FirebaseFirestore.instance.collection('hoja_devida');

  try {
    // Agrega el nuevo registro en la colección 'hoja_devida'
    await hojaDeVidaCollection.add({
      'id_hembra': id_hembra,
      'id_parto': id_parto,
      'id_macho': id_macho,
      'fecha_monta': fecha_monta,
      'fecha_destete': fecha_destete,
      'fecha_celo': fecha_celo,
      'fecha_parto': fecha_parto,
      'ingreso_paridera': ingreso_paridera,
      'real_parto': real_parto,
      'duracion_parto': duracion_parto,
      'total_nacidos': total_nacidos,
      'nacidos_vivos': nacidos_vivos,
      'nacidos_muertos': nacidos_muertos,
      'momias': momias,
      'fecha_destetecrias': fecha_destetecrias,
      'destetados': destetados,
    });



    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('LA HOJA DE VIDA SE GUARDÓ CORRECTAMENTE'),
      ),
    );
    print(id_hembra);
    print('Hoja de vida registrada correctamente.');
  } catch (e) {
    // Manejo de errores más detallado
    print('Error al registrar la hoja de vida: $e');

    // Puedes mostrar un mensaje de error específico al usuario si lo deseas
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error al registrar la hoja de vida. Verifica los datos e intenta nuevamente.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}


class FirebaseServicenombre {
  Future<List<Item>> fetchItems() async {
    List<Item> itemsList = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('registro_macho').get();

      querySnapshot.docs.forEach((doc) {
        int idMacho = doc['id_macho'] as int; // Obtener el valor como un int
        String nombre = doc['nombre'] as String; // Se asume que 'nombre' es de tipo String
        itemsList.add(Item(idMacho, nombre));
      });
    } catch (e) {
      print('Error al obtener los items: $e');
    }

    return itemsList;
  }
}

Future<void> agregarusuarios(String email) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('usuarios');

  try {
    await collectionReference.add({
      'correo': email,
    });

    print('Correo guardado correctamente.');
  } catch (e) {
    print('Error al guardar el correo: $e');
  }
}






