import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopcard/api/product.dart';
import 'package:shopcard/screen/sidebar.dart';
import 'package:shopcard/widget/cart.dart';
import 'package:shopcard/widget/dropdown.dart';
import 'package:shopcard/widget/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = 'All';

  // List of categories
  final List<String> categories = ['All', 'cloth', 'accessory', 'electric'];

  // List of sort options
  final List<String> sortOptions = ['Price', 'Country'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          title: Column(
            children: [
              Image.asset(
                'assets/img/applogo.png',
                width: 20,
                height: 20,
              ),
              Text(
                'Shoer.kh',
                style: GoogleFonts.aclonica(
                  fontSize: 15,
                ),
              )
            ],
          ),
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                  Icons.stacked_bar_chart,
                  size: 30,
                ),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ProductSearchDelegate(products),
                );
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            )
          ],
        ),
        drawer: const Drawer(
          width: 300,
          backgroundColor: Colors.white,
          elevation: 10,
          child: SideBar(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: GoogleFonts.abyssinicaSil(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropDown(
                    allList: sortOptions,
                    onItemSelected: (value) {
                      setState(() {
                        selectedCategory = value ?? "All";
                        // Implement sorting logic here
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50, // Fixed height for the category list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _productType(
                      context,
                      categories[index],
                      isSelected: categories[index] == selectedCategory,
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                          // Implement category filtering here
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: products.isEmpty
                    ? const Center(child: Text('No products available'))
                    : GridView.builder(
                        itemCount: selectedCategory == 'All'
                            ? products.length
                            : products
                                .where((p) =>
                                    p.productType.name == selectedCategory)
                                .length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              (MediaQuery.of(context).size.width / 200)
                                  .floor()
                                  .clamp(2, 4),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: .58,
                        ),
                        itemBuilder: (context, index) {
                          // Get the filtered list
                          final displayedProducts = selectedCategory == 'All'
                              ? products
                              : products
                                  .where((p) =>
                                      p.productType.name == selectedCategory)
                                  .toList();

                          return CartProduct(product: displayedProducts[index]);
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _productType(
    BuildContext context,
    String productType, {
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue[400]
              : Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Center(
            child: Text(productType,
                style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onTertiary,
                )),
          ),
        ),
      ),
    );
  }
}
