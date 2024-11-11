import 'package:flutter/material.dart';
import 'package:multipantallas/bienvenida.dart';

// Método main
void main() {
  runApp(const Primera());
}

class Primera extends StatelessWidget {
  const Primera({super.key});
  // Método que construye los widgets de la app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiformularios",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const Pantalla(),
    );
  }
}
// El método build si agregamos los widgets de una app
// quedaría muy extenso y complica la estructura del código
// solución: estructurar en distintas clases

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  // Id de los campos de texto
  var txtLogin = TextEditingController();
  var txtPassword = TextEditingController();
  // Variables para almacenar los datos ingresados por el usuario
  var nombre = "";
  var clave = " ";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("img/fondo1.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Multiformularios"),
        ),
        body: ListView(
          // add some widgets
          children: [
            // Agregamos el logo
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              alignment: Alignment.center,
              child: Image.asset("img/logo.png"),
            ),
            // Agregamos el campo de texto para el login
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                // para formatearlo le agregamos un decoration
                decoration: const InputDecoration(
                  hintText: "Nombre de Usuario",
                ),
                // id del campo de texto
                controller: txtLogin,
              ),
            ),

            // Agregamos el campo de texto para el password
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                // para formatearlo le agregamos un decoration
                decoration: const InputDecoration(
                  hintText: "clave de usuario",
                ),
                obscureText: true, // Oculta la clave
                // id del campo de texto
                controller: txtPassword,
              ),
            ),

            // Agregmos el botón de validar
            Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Código del botón
                  // Leer el contenido de los campos
                  nombre = txtLogin.text;
                  clave = txtPassword.text;
                  // Validar el login y el password
                  if (nombre == "pelochas" && clave == "123") {
                    // Saltar al siguiente formulario Bienvenida
                    Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        // Llamamos al constructor y pasamos el dato
                        return Bienvenida(nombre);
                      }),
                    );
                  } else {
                    // Desplegar alertDialog
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Advertencia"),
                            //child: Image.asset("img/valid.png"),
                            content: const SingleChildScrollView(
                              child: ListBody(
                                children: const [
                                  Text("Verifica tus Credenciales"),
                                  SizedBox(height: 16.0),
                                  Image(
                                    image: AssetImage("img/error.png"),
                                    width: 200,
                                    height: 200,
                                  )
                                ],
                              ),
                            ),

                            // Botones del alertDialog
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Aceptar")),
                            ],
                          );
                        });
                  }
                },
                label: const Text("Validar"),
                icon: const Icon(Icons.login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
