import 'package:app_testes_unitarios/features/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final controller = GetIt.I<LoginController>();

  @override
  void initState() {
    super.initState();
    controller.getUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Observer(
        builder: (_) {
          return Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                    backgroundImage: NetworkImage(controller.userInfo?.image ?? 'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png'),
                  ),
                  const SizedBox(height: 20),
                  Divider(),
                  const SizedBox(height: 20),
                Text('Nome: ${controller.userInfo?.firstName ?? 'No user'} ${controller.userInfo?.lastName ?? ''}'),
                Text('Email: ${controller.userInfo?.email ?? 'No email'}'),
                Text('Telefone: ${controller.userInfo?.username ?? 'No phone'}'),
              ],
            ),
          );
        },
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(controller.userInfo?.image ?? 'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png'),
                  ),
                ),
              );
          }
        )
      ),
      body: Center(
        child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                children: List.generate(6, (index) {
        return Container(
          color: Colors.blue,
          child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white),
              ),
          ),
        );
                }),
              ),
      ),
    );
  }
}