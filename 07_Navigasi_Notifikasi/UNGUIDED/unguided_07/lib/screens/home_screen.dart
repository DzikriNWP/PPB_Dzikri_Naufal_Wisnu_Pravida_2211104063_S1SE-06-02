// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:unguided_07/screens/cart_screen.dart';
import '../models/product.dart';
import './product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Sepatu Olahraga',
      description:
          'Sepatu olahraga berkualitas tinggi untuk aktivitas sehari-hari',
      price: 799000,
      imageUrl:
          'https://down-id.img.susercontent.com/file/id-11134207-7r98v-lxw3d0dx55wuf4',
    ),
    Product(
      id: 2,
      name: 'Tas Ransel',
      description: 'Tas ransel dengan kapasitas besar dan tahan air',
      price: 450000,
      imageUrl:
          'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2023/10/9/9ae47f77-a82d-4d2b-854e-daf4f149eded.jpg',
    ),
    Product(
      id: 3,
      name: 'Jam Tangan Digital',
      description: 'Jam tangan digital dengan berbagai fitur modern',
      price: 1200000,
      imageUrl:
          'https://www.skmei-id.com/public/upload/product/jam-tangan-pria-skmei-analog-casual-men-stainless-strap-original-9096cs-1499003652.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TokoPedei'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp ${product.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
