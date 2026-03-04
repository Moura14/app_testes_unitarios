import 'package:app_testes_unitarios/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeDetalhes extends StatefulWidget {
  const HomeDetalhes({super.key, required this.id});

  final int id;

  @override
  State<HomeDetalhes> createState() => _HomeDetalhesState();

}

class _HomeDetalhesState extends State<HomeDetalhes> {


  final homeController = GetIt.I<HomeController>(); 

  @override
  void initState() {
    super.initState();
    homeController.getProdutoDetalhes(id: widget.id);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Produto"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if(homeController.isLoading){
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey[300],
                child: Builder(
                  builder: (_) {
                    final images = homeController.productDetailsModel?.images;
                    final imageUrl = (images != null && images.isNotEmpty)
                        ? images.first
                        : 'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png';
                    return Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
        
              const SizedBox(height: 16),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        
          
                     Text(
                      homeController.productDetailsModel?.title ?? 'Produto sem título',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    const SizedBox(height: 8),
              

                     Text(
                      'R\$ ${homeController.productDetailsModel?.price ?? 0},00',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
        
                    const SizedBox(height: 8),
        
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star_border, color: Colors.amber),
                        SizedBox(width: 8),
                        Text("(4.0)"),
                      ],
                    ),
        
                    const SizedBox(height: 16),
        
                    
                     Text(
                      "Descrição",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    const SizedBox(height: 8),
        
                     Text(
                      homeController.productDetailsModel?.description ?? 'Descrição não disponível',
                      style: TextStyle(fontSize: 14),
                    ),
        
                    const SizedBox(height: 20),
        
                    
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        );
        }
      ),

      
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Adicionar ao Carrinho"),
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }
}