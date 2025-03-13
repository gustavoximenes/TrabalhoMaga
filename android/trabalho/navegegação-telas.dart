import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Produtos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imagePath;
  final String description;

  Product({required this.name, required this.price, required this.imagePath, required this.description});
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: "Notebook Intel", price: 49.99, imagePath: "assets/images/notebook2.jpg", description: "Descrição detalhada do Produto 1."),
    Product(name: "Notebook AMD", price: 59.99, imagePath: "assets/images/notebook.png", description: "Descrição detalhada do Produto 2."),
    Product(name: "Fone Samsung", price: 89.99, imagePath: "assets/images/fone2.jpg", description: "Descrição detalhada do Produto 3."),
    Product(name: "Microfone Samsung", price: 99.99, imagePath: "assets/images/microfone.jpg", description: "Descrição detalhada do Produto 4."),
    Product(name: "Gabinete Gamer", price: 29.99, imagePath: "assets/images/gabinete.png", description: "Descrição detalhada do Produto 5."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catálogo de Produtos")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.asset(product.imagePath, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.name),
              subtitle: Text("R\$ ${product.price.toStringAsFixed(2)}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(product.imagePath, width: 200, height: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 16),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("R\$ ${product.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 8),
            Text(product.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
