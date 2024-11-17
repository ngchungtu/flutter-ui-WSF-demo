import 'package:flutter/material.dart';
import 'package:plant_app/models/products.dart';
import 'package:plant_app/providers/product_provider.dart';
import 'package:plant_app/ui/screens/widgets/product_widget.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    // context.read<ProductProvider>().getAll();
    ProductProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: FutureBuilder<List<Product>>(
        future: ProductProvider.fetchData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // print('snapshot: ${snapshot.connectionState}');
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                // return ListTile(
                //   title: Text(item.title!),
                //   subtitle: Text(item.body!),
                // );
                return ProductWidget(product: item);
              },
            );
          }
        },
      ),
    );
  }
}
