class RegisterScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
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
      resizeToAvoidBottomInset: true, // Ajustar al teclado automáticamente
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Campo de nombre
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
                            if (value.length < 6) {
                              return "La contraseña debe tener al menos 6 caracteres";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),

                        // Espaciador flexible para empujar el botón hacia abajo
                        Expanded(child: Container()),

                        // Botón de registro
                        ElevatedButton(
                          onPressed: () => _register(context),
                          child: Text("Registrarse"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
