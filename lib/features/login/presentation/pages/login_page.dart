import 'package:app_testes_unitarios/features/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final controller = GetIt.I<LoginController>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  initState() {
    super.initState();
    controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'E-mail',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller:  passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
                labelText: 'Senha',
                border: OutlineInputBorder()
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
                  onPressed: (){
                    if(controller.errorMessage != null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(controller.errorMessage!))
                      );
                    }
                    controller.login(userNameController.text, passwordController.text);
                  }, 
                  child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 15))),
              );
              },
            )
          ],
        ),
      ),
    );
  }
}