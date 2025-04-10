import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopcard/api/product.dart';

class ProductSale extends StatefulWidget {
  final Product product;
  const ProductSale({super.key, required this.product});

  @override
  State<ProductSale> createState() => _ProductSaleState();
}

class _ProductSaleState extends State<ProductSale> {
  int orderSum = 0;
  int _rating = 0;
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            // Top part with image and app bar
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.product.productImage,
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 5,
                        left: 5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  width: 2,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () => {context.pop()},
                                child: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    size: 30,
                                    Icons.chevron_left,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              widget.product.productType.name,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  liked = !liked;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(
                                    size: 25,
                                    color: Colors.red,
                                    liked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Middle content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.productName,
                      style: GoogleFonts.abel(
                        fontSize: 45,
                        color: Theme.of(context).colorScheme.onSurface,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          // Check if the index is less than the rating to show filled stars
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = index +
                                    1; // Update rating based on user tap
                              });
                            },
                            child: Icon(
                              index < _rating ? Icons.star : Icons.star_border,
                              color: Colors.yellow, // Star color
                              size: 30.0, // Star size
                            ),
                          );
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '\$ ${widget.product.productPrice}',
                        style: GoogleFonts.abel(
                          fontSize: 20,
                          color: Colors.blue[400],
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Description',
                        style: GoogleFonts.abel(
                          fontSize: 20,
                          color: Colors.blue[400],
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.product.productDes,
                        style: GoogleFonts.abel(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 118, 117, 116),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.blue[400]!),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.delivery_dining),
                                  Text(
                                    ' Free delivery',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue[400],
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.timelapse),
                                  Text(
                                    ' 34mn',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 115, 114, 112),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 20),
                                  Text(
                                    ' ${widget.product.productRate}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom "Add to Cart" section
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 1, color: Colors.blue[400]!),
                        ),
                        child: IconButton(
                          onPressed: () => {
                            setState(() {
                              if (orderSum > 0) {
                                orderSum--;
                              }
                            })
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        orderSum.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 1, color: Colors.blue[400]!),
                        ),
                        child: IconButton(
                          onPressed: () => {
                            setState(() {
                              orderSum++;
                            })
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (orderSum > 0) {
                          _showMyDialog(context);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(Icons.shop),
                            SizedBox(width: 10),
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('AlertDialog Title'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Successfully purchase product'),
              // Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('accept'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
