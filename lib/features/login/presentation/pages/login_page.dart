import 'package:app_testes_unitarios/features/login/presentation/controllers/login_controller.dart';
import 'package:app_testes_unitarios/features/login/presentation/pages/cadastro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:app_testes_unitarios/features/home/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final controller = GetIt.I<LoginController>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = false;

  final _key = GlobalKey<FormState>();

  initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _key,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Login', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Campo obrigatório";
                            }
                            return null;
                          },
                          controller: userNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'E-mail',
                            border: OutlineInputBorder()
                          ),
                        ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                  obscureText: obscurePassword,
                  controller:  passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                  
                ),
              const SizedBox(height: 20),
              Observer(
                builder: (_){
                  if(controller.isLoading){
                    return CircularProgressIndicator();
                  } 
                
                return SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                    ),
                    onPressed: () async {
                      // clear previous error
                      controller.errorMessage = null;
                      if(_key.currentState?.validate() ?? false){
                         await controller.login(userNameController.text, passwordController.text);
                      }
          
                
                      final error = controller.errorMessage;
                      if (error != null && error.isNotEmpty) {
                        print(error);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Não foi possível realizar login. Tente novamente mais tarde')),
                        );
                      } else if (controller.user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      }
                    },
           
                    child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 15))),
                );
                },
              ),
          
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CadastroPage()),
                  );
                },
                child: Text('Não tem uma conta? Cadastre-se'),
              )
            ],
          ),
        ),
      ),
    )));
  }));
  }
}