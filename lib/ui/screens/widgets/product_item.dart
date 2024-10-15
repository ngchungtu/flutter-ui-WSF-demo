import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_app/models/products.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Image.network(product.image),
              ListTile(
                title: Text(product.title),
                subtitle: Text('${product.price} \$'), // this is fetch the price from the api
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
      ),
    );
  }
}
