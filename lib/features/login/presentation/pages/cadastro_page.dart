import 'package:app_testes_unitarios/core/utils/input_fomrmatter.dart';
import 'package:app_testes_unitarios/features/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  final controller = GetIt.I<LoginController>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool obsecurePassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Campo obrigatório";
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Nome",
                            border: OutlineInputBorder(),
                          ),
                        ),
            
                const SizedBox(height: 16),
            
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Campo obrigatório";
                    }else if(value.length < 14){
                      return "Telefone inválido";
                    }
                    return null;
                  },
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    AppInputFormatters.phoneFormatter,
                  ],
                  decoration: InputDecoration(
                    labelText: "Telefone",
                    border: OutlineInputBorder(),
                  ),
                ),
            
                const SizedBox(height: 16),
            
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Campo obrigatório";
                    }else if(!value.contains('@')){
                      return "Email inválido";
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
            
                const SizedBox(height: 16),
            
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Campo obrigatório";
                    }else if(value.length < 6){
                      return "A senha deve conter no mínimo 6 caracteres";
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: obsecurePassword,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obsecurePassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obsecurePassword = !obsecurePassword;
                        });
                      },
                    ),
                  ),
                ),
            
                const SizedBox(height: 24),
            
                Observer(
                  builder: (_) {
                    if(controller.isLoading){
                      return CircularProgressIndicator();
                    }else{
                      return SizedBox(
                    
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black
                        ),
                      onPressed: () async{
                        if(_formKey.currentState?.validate() ?? false){
                         await  controller.cadastroUsuario(
                          nome: nameController.text, 
                          phone: phoneController.text, 
                          email: emailController.text, 
                          password: passwordController.text
                        );
                        }
                      },
                      child: const Text("Cadastrar", style: TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                  );
                    }
                  }
                   
                ),
            
              ],
            ),
          ),
        ),
      ),
            )
      );}));
  }
}