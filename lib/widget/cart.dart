import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopcard/api/product.dart';
import 'package:shopcard/widget/product.dart';

class CartProduct extends StatefulWidget {
  final Product product;

  const CartProduct({super.key, required this.product});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  bool _liked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductSale(product: widget.product)))
            },
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              Color.fromARGB(255, 2, 11, 92)
                            ], // Gradient colors
                            begin: Alignment
                                .bottomCenter, // Starting point of the gradient
                            end: Alignment
                                .topCenter, // Ending point of the gradient
                          ),
                        ),
                        child: Text(
                          widget.product.productRate.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _liked = !_liked; // Toggle the _liked state
                          });
                        },
                        child: Icon(
                          _liked
                              ? Icons.favorite
                              : Icons
                                  .favorite_border_outlined, // Switch between filled and outlined heart
                          color: _liked
                              ? Colors.red
                              : Colors.grey, // Red if liked, grey otherwise
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            widget.product.productImage,
                            width: double
                                .infinity, // Make the image take up the full width
                            height:
                                120.0, // You can adjust the height as needed
                            fit: BoxFit
                                .cover, // To make sure the image is properly scaled
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                  child: Image.asset(
                                      height: 120, 'assets/img/notfound.png'));
                            },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.product.productName,
                                style: GoogleFonts.aBeeZee(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Opacity(
                                opacity: 0.5,
                                child: Text(
                                  widget.product.productDes,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Dynamically adjust font size based on the price length
                              Text(
                                '\$${widget.product.productPrice}',
                                style: TextStyle(
                                  fontSize: widget.product.productPrice
                                              .toString()
                                              .length >
                                          4
                                      ? 15
                                      : 20, // Adjust font size based on price length
                                  color: const Color.fromARGB(255, 9, 84, 247),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const Center(
                                            child: AlertDialog(
                                          content:
                                              Text('successfully add to cart'),
                                        ));
                                      });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: Colors.blue[400],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'add',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                  )
                ],
              ),
            )));
  }
}
