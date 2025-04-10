import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProductSetting extends StatefulWidget {
  const ProductSetting({super.key});

  @override
  State<ProductSetting> createState() => _ProductSettingState();
}

class _ProductSettingState extends State<ProductSetting> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(textScaler: TextScaler.linear(1.5), tabs: [
                Text('create product'),
                Text('manage product'),
              ]),
              actions: const [
                Text(
                  'Product setting',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                )
              ],
              leading: IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: 40,
                ),
                onPressed: () => context.pop(),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: TabBarView(children: [_createProduct(), _manageProduct()]),
            )));
  }
}

Future<void> getLostData() async {
  final ImagePicker picker = ImagePicker();
  final LostDataResponse response = await picker.retrieveLostData();
  if (response.isEmpty) {
    return;
  }
  final List<XFile>? files = response.files;
  if (files != null) {
    // _handleLostFiles(files);
    // print(files);
  } else {
    // print(response.exception);
  }
}

Widget _manageProduct() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Search...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        const Expanded(
            child: Center(
          child: Text('0 products'),
        ))
      ],
    ),
  );
}

Widget _createProduct() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Product Image',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
                onTap: () {
                  getLostData();
                },
                child: SizedBox(
                    width: double.maxFinite,
                    child: DottedBorder(
                        color: Colors.blue,
                        strokeWidth: 4,
                        dashPattern: const [10, 10],
                        padding: const EdgeInsets.all(40),
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        child: const Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.blue,
                                  size: 40,
                                ),
                                Text(
                                  'select image',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            )))))),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Product Name',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Enter product name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Product Description',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            maxLines: 10,
            maxLength: 400, // Max length of text
            decoration: InputDecoration(
              hintText: 'Enter product description',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          GestureDetector(
              onTap: () {},
              child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  height: 40,
                  width: 100,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.create,
                        color: Colors.white,
                      ),
                      Text(
                        'Create',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )))
        ])
      ],
    ),
  );
}
