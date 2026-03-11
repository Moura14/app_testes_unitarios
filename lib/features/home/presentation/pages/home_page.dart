import 'package:app_testes_unitarios/features/home/presentation/controllers/home_controller.dart';
import 'package:app_testes_unitarios/features/home/presentation/pages/cart_detalhes.dart';
import 'package:app_testes_unitarios/features/home/presentation/pages/home_detalhes.dart';
import 'package:app_testes_unitarios/features/login/presentation/controllers/login_controller.dart';
import 'package:app_testes_unitarios/features/login/presentation/pages/login_page.dart';
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
  final homeController = GetIt.I<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.getProduto().then((_) {
      print('produtos carregados ${homeController.products.length}');
    });
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
                    backgroundImage: NetworkImage('https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png'),
                  ),
                  const SizedBox(height: 20),
                  Divider(),
                  const SizedBox(height: 20),
                Text('Nome: Neymar'),
                Text('Email: ney@gmail.com'),
                Text('Telefone: 921-021021-'),
                const SizedBox(height: 400),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    TextButton(
                      onPressed: () async {
                        await controller.logout();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                      child: const Text('Sair'),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Pesquisar',
            border: InputBorder.none,
          ),
          onChanged: (value){
           homeController.pesquisaProduto(produto: value);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => CarrinhoPage()));
            },
          )
        ],
        leading: Builder(
          builder: (context) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage( 'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png'),
                  ),
                ),
              );
          }
        ),
      
      ),
      body: Observer(
        builder: (_){
        
          
          if(homeController.isLoading){
            return Center(child: CircularProgressIndicator());
          }

          if (homeController.products.isEmpty) {
            return const Center(child: Text('Nenhum produto disponível'));
          }
          
      
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemCount: homeController.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Observer(
            builder: (_) {
              if(homeController.isLoading){
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                ClipRRect(
                   borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          child: Builder(
            builder: (_) {
        final imageUrl = homeController.products[index].thumbnail;
        
        if (imageUrl == null || imageUrl.isEmpty) {
          return Container(
            height: 120,
            width: double.infinity,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: Icon(Icons.image, size: 40),
          );
        }
        
        return Image.network(
          imageUrl,
          height: 120,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 120,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: Icon(Icons.broken_image),
          ),
        );
            },
          ),
        ),
            
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
            
                        
                        Text(
                          '${homeController.products[index].title}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
            
                       
                        Text(
                          'R\$ ${homeController.products[index].price ?? 0}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    
                        SizedBox(
                          width: double.infinity,
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => HomeDetalhes(id: homeController.products[index].id)),
                              );
                            },
                            child: const Text('Ver detalhes'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
            },
          ),
        );
        }
          );
  }));
        }
    
  }
