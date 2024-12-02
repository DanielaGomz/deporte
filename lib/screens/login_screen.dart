import 'package:flutter/material.dart';
import '../main.dart'; // La pantalla principal a la que redirigiremos después del login.

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Credenciales de ejemplo (puedes reemplazarlas con datos reales).
  final String correctEmail = "user@example.com";
  final String correctPassword = "123456";

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      if (email == correctEmail && password == correctPassword) {
        // Credenciales correctas, navegar a la pantalla principal.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        // Mostrar error.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Correo o contraseña incorrectos")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de correo
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Correo electrónico"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingresa tu correo";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Ingresa un correo válido";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Campo de contraseña
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Contraseña"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingresa tu contraseña";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),

              // Botón de login
              ElevatedButton(
                onPressed: _login,
                child: Text("Iniciar Sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
