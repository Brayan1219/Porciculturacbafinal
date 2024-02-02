import 'package:flutter/material.dart';

class Evento {
  final String descripcion;
  final TimeOfDay? hora; // Agregar propiedad de hora

  Evento({required this.descripcion, this.hora});
}

class HoraEvento {
  final int hour;
  final int minute;

  HoraEvento(this.hour, this.minute);

  // Constructor para crear desde TimeOfDay
  factory HoraEvento.fromTimeOfDay(TimeOfDay timeOfDay) {
    return HoraEvento(timeOfDay.hour, timeOfDay.minute);
  }

  // Método para convertir a TimeOfDay
  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }

  // Método para formatear la hora como lo hace TimeOfDay
  String format(BuildContext context) {
    return MaterialLocalizations.of(context).formatHour(TimeOfDay(
      hour: hour,
      minute: minute,
    )) +
        MaterialLocalizations.of(context).formatMinute(TimeOfDay(
          hour: hour,
          minute: minute,
        ));
  }
}
