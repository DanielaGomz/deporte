import 'package:flutter/material.dart';
import 'screens/leggins_screen.dart';
import 'screens/pantalonetas_screen.dart';
import 'screens/camisas_screen.dart';
import 'screens/tops_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tienda de Deportes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(), // La pantalla inicial ahora será la de Login
    );
  }
}
// Simulación de base de datos local para usuarios registrados
List<Map<String, String>> registeredUsers = [];

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Credenciales de ejemplo
  final String correctEmail = "user@example.com";
  final String correctPassword = "123456";

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      // Verifica si el usuario está registrado
      bool userExists = registeredUsers.any((user) =>
      user['email'] == email && user['password'] == password);

      if (userExists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Correo o contraseña incorrectos")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Iniciar Sesión")),
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

              // Botón de iniciar sesión
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text("Iniciar Sesión"),
              ),
              SizedBox(height: 16),

              // Botón de registro
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  "¿No tienes cuenta? Regístrate aquí",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      // Agregar el usuario a la lista local
      registeredUsers.add({
        'name': name,
        'email': email,
        'password': password,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registro exitoso")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nombre completo"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingresa tu nombre";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
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
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: "Contraseña"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingresa tu contraseña";
                  }
                  if (value.length < 6) {
                    return "La contraseña debe tener al menos 6 caracteres";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _register(context),
                child: Text("Registrarse"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda de Deportes'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Encabezado del menú
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lista de Usuarios'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserListScreen()),
                );
              },
            ),
            // Opción: Lista de productos
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Tienda de Deportes'),
              onTap: () {
                Navigator.pop(context); // Cierra el menú
              },
            ),

            // Opción: Leggins
            ListTile(
              leading: Icon(Icons.checkroom),
              title: Text('Leggins'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LegginsScreen()),
                );
              },
            ),

            // Opción: Pantalonetas
            ListTile(
              leading: Icon(Icons.sports_volleyball),
              title: Text('Pantalonetas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantalonetasScreen()),
                );
              },
            ),

            // Opción: Camisas
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Camisas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CamisasScreen()),
                );
              },
            ),

            // Opción: Tops
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Tops'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopsScreen()),
                );
              },
            ),

            // Opción: Iniciar Sesión
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false, // Elimina las pantallas previas
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Leggins'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LegginsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Pantalonetas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PantalonetasScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Camisas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CamisasScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Tops'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Usuarios")),
      body: ListView.builder(
        itemCount: registeredUsers.length,
        itemBuilder: (context, index) {
          final user = registeredUsers[index];
          return ListTile(
            title: Text(user['name'] ?? ""),
            subtitle: Text(user['email'] ?? ""),
          );
        },
      ),
    );
  }
}
