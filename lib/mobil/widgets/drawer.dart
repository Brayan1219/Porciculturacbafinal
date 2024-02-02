import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    //final double imagen = size.width * 0.1;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Nombre Cliente"),
            accountEmail: Text("correocli@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network('https://cdn.pixabay.com/animation/2022/12/01/17/03/17-03-11-60_512.gif', width: double.infinity,fit: BoxFit.cover,),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    image: NetworkImage("https://media1.giphy.com/media/2tNvsKkc0qFdNhJmKk/giphy.gif"),fit: BoxFit.cover)
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('CONFIGURACION'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('MIS DATOS'),
            onTap: ()=> print('Perfil Consulado'),
          ),
          ListTile(
            leading: Icon(Icons.output_sharp),
            title: Text('CERRAR SESION'),
            onTap: ()=> print('Perfil Consulado'),
          ),
        ],
      ),
    );
  }
}