import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

void main() => runApp(pdf());

class pdf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<void> _downloadData(BuildContext context) async {
    final response = await http.get(Uri.parse('https://<Porcicultura>.firebaseio.com/.json'));

    if (response.statusCode == 200) {
      // Descargar datos exitosa
      final jsonData = jsonDecode(response.body);
      final jsonString = jsonEncode(jsonData);

      // Obtener el directorio de documentos
      final directory = await getExternalStorageDirectory();
      final filePath = '${directory?.path}/datos.json';

      // Guardar los datos en el archivo
      File(filePath).writeAsStringSync(jsonString);

      // Mostrar un mensaje indicando que los datos han sido descargados
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Datos descargados en $filePath'),
        ),
      );
    } else {
      // Mostrar un mensaje de error si la descarga falla
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al descargar datos: ${response.statusCode}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descargar Datos desde Firebase'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _downloadData(context),
          child: Text('Descargar Datos'),
        ),
      ),
    );
  }
}
