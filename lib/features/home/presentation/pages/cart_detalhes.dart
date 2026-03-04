import 'package:app_testes_unitarios/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {


  final homeController = GetIt.I<HomeController>();


  @override
  void initState() {
    homeController.getCart();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Carrinho"),
      ),
      body: Observer(
        builder: (_) {
          if(homeController.isLoading){
            return const Center(child: CircularProgressIndicator());
          }

          if(homeController.cartModel == null || homeController.cartModel!.products.isEmpty){
            return const Center(child: Text("Seu carrinho está vazio"));
          }
          return ListView.builder(
            itemCount: homeController.cartModel?.products.length ?? 0,
            itemBuilder: (context, index){
            
            final produto = homeController.cartModel!.products[index];

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [ 
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                produto.thumbnail,
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.image),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    produto.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "R\$ ${produto.price.toStringAsFixed(2)}",
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: (){}
                                      ),
                                      Text(
                                        produto.quantity.toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: (){

                                        }
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.red),
                              onPressed: (){},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Total: R\$ ${produto.total}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Compra finalizada!"),
                                ),
                              );
                            },
                            child: const Text("Finalizar Compra"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
             
          );
        },
    ));
  }
}