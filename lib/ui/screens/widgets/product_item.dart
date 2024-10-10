import 'package:flutter/material.dart';
import 'package:plant_app/models/products.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // this is the coloumn
          children: [
            // Positioned(
            //   bottom: 5,
            //   left: 0,
            //   right: 0,
            //   child: SizedBox(
            //     height: 80.0,
            //     child: Image.asset(product.image),
            //   ),
            // ),
            ListTile(
              title: Text(product.title),
              subtitle: Text(
                  '${product.price} \$'), // this is fetch the price from the api
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star,
                      color: Colors.orange), // this will give the rating
                  Text('${product.rating}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
