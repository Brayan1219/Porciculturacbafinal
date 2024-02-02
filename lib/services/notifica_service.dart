import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

void notifi() {
  startDailyTask();
}

void startDailyTask() {
  DateTime now = DateTime.now();
 //prueba DateTime now = DateTime(2024, 5, 13);
  print('Fecha y hora actual: $now');


  DateTime nextDailyExecution = now.add(Duration(days: 1 )); //minutes: 1  prueba
  Duration timeUntilNextExecution = nextDailyExecution.difference(now);
  print('Tiempo hasta la próxima ejecución: $timeUntilNextExecution');

  Timer(timeUntilNextExecution, () async {
    print('Prueba: Temporizador ejecutado');

    await limpiarNotificaciones();
    print('Prueba: limpiarNotificaciones ejecutado');
    await notifilimpieza();
    print('Prueba: notifilimpieza ejecutado');
    await consultarparto();
    print('Prueba: notifireal parto ejecutado');
    await consultarparidera();
    await consultarcelo();
    await consultardestete();
  });
}


Future<void> notifilimpieza() async {
  try {
    // Crear un nuevo documento en la colección 'notificaciones'
    await FirebaseFirestore.instance.collection('notificaciones').add({
      'titulo': 'LIMPIEZA',
      'mensaje': 'Recuerda hacer el registro de limpieza',
    });

    print('Notificación de limpieza guardada en Firestore');
  } catch (e) {
    print('Error al guardar la notificación en Firestore: $e');
  }
}

Future<void> limpiarNotificaciones() async {
  try {

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('notificaciones').get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      await doc.reference.delete();
    }

    print('Colección de notificaciones limpiada en Firestore');
  } catch (e) {
    print('Error al limpiar la colección de notificaciones en Firestore: $e');
  }
}

Future<void> consultarparto() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection('hoja_devida').get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> datos = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

      DateTime fechaActual = DateTime.now();
     //prueba DateTime fechaActual = DateTime(2024, 5, 18);


      for (var hembra in datos) {
        if (hembra.containsKey('real_parto')) {
          int idHembra = hembra['id_hembra'];
          Timestamp fechaPartoTimestamp = hembra['real_parto'];

          DateTime fechaPartoDateTime = fechaPartoTimestamp.toDate();

          if (fechaActual.year == fechaPartoDateTime.year &&
              fechaActual.month == fechaPartoDateTime.month &&
              fechaActual.day == fechaPartoDateTime.day) {
            await FirebaseFirestore.instance.collection('notificaciones').add({
              'titulo': 'PARTO',
              'mensaje': 'Recuerda hoy $fechaPartoDateTime la hembra $idHembra tendrá su parto',
            });
          }
        }
      }
    } else {
      print('No se encontraron documentos en la colección');
    }
  } catch (error) {
    print("Error al consultar Firestore: $error");
  }
}

Future<void> consultarparidera() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection('hoja_devida').get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> datos = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

       DateTime fechaActual = DateTime.now();
     //prueba DateTime fechaActual = DateTime(2024, 5, 13);


      for (var hembra in datos) {
        if (hembra.containsKey('ingreso_paridera')) {
          int idHembra = hembra['id_hembra'];
          Timestamp fechaPartoTimestamp = hembra['ingreso_paridera'];

          DateTime fechaPartoDateTime = fechaPartoTimestamp.toDate();

          if (fechaActual.year == fechaPartoDateTime.year &&
              fechaActual.month == fechaPartoDateTime.month &&
              fechaActual.day == fechaPartoDateTime.day) {
            await FirebaseFirestore.instance.collection('notificaciones').add({
              'titulo': 'PARIDERA',
              'mensaje': 'Recuerda hoy $fechaPartoDateTime la hembra $idHembra debe entrar a paridera',
            });
          }
        }
      }
    } else {
      print('No se encontraron documentos en la colección');
    }
  } catch (error) {
    print("Error al consultar Firestore: $error");
  }
}

Future<void> consultarcelo() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection('hoja_devida').get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> datos = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

       DateTime fechaActual = DateTime.now();
      // prueba DateTime fechaActual = DateTime(2024, 5, 13);

      for (var hembra in datos) {
        if (hembra.containsKey('fecha_destetecrias')) {
          int idHembra = hembra['id_hembra'];
          Timestamp fechaPartoTimestamp = hembra['fecha_destetecrias'];

          DateTime fechaPartoDateTime = fechaPartoTimestamp.toDate();
          DateTime fechacelo = DateTime.now().add(Duration(days: 7));

          if (fechacelo.year == fechaPartoDateTime.year &&
              fechacelo.month == fechaPartoDateTime.month &&
              fechacelo.day  == fechaPartoDateTime.day) {
            await FirebaseFirestore.instance.collection('notificaciones').add({
              'titulo': 'CELO',
              'mensaje': 'La hembra $idHembra ya entro en celo',
            });
          }
        }
      }
    } else {
      print('No se encontraron documentos en la colección');
    }
  } catch (error) {
    print("Error al consultar Firestore: $error");
  }
}

Future<void> consultardestete() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection('hoja_devida').get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> datos = querySnapshot.docs
          .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
          .toList();

       DateTime fechaActual = DateTime.now();
     //prueba DateTime fechaActual = DateTime(2024, 5, 13);

      for (var hembra in datos) {
        if (hembra.containsKey('fecha_destetecrias')) {
          int idHembra = hembra['id_hembra'];
          Timestamp fechaPartoTimestamp = hembra['fecha_destetecrias'];

          DateTime fechaPartoDateTime = fechaPartoTimestamp.toDate();

          if (fechaActual.year == fechaPartoDateTime.year &&
              fechaActual.month == fechaPartoDateTime.month &&
              fechaActual.day  == fechaPartoDateTime.day) {
            await FirebaseFirestore.instance.collection('notificaciones').add({
              'titulo': 'DESTETE',
              'mensaje': 'Las crias de la hembra $idHembra ya deben destetarce',
            });
          }
        }
      }
    } else {
      print('No se encontraron documentos en la colección');
    }
  } catch (error) {
    print("Error al consultar Firestore: $error");
  }
}
