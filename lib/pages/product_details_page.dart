import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog_app_flutter/providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  

  void onTap() {
    
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          //'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'discription':  widget.product['discription'],
          //'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('added to favourite successfully!'),
        ),
      );
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ListView(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 250,
            ),
          ),
         
          Container(
             padding: const EdgeInsets.all(20),
              color: const Color.fromRGBO(245, 247, 249, 1),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                  child:Text(
                   widget.product['discription'] as String,
                  style: Theme.of(context).textTheme.titleLarge,
                 ),
                 ),
                const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                       minimumSize: const Size(350, 50),
                    ),
                    child: const Text(
                      'Add To Favourite',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}
