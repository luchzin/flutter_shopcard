enum ProductType {
  cloth,
  accessory,
  electric,
}

class Product {
  final String productName;
  final double productPrice;
  final double productRate;
  final String productImage;
  final String productDes;
  final ProductType productType;

  Product({
    required this.productType,
    required this.productName,
    required this.productPrice,
    required this.productRate,
    required this.productDes,
    required this.productImage,
  });
}

List<Product> products = [
  // Electronics (electric)
  Product(
    productType: ProductType.electric,
    productName: 'Wireless Headphones',
    productPrice: 99.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
    productDes: 'High-quality wireless headphones with noise cancellation.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Bluetooth Speaker',
    productPrice: 49.99,
    productRate: 4.2,
    productImage:
        'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb',
    productDes: 'Portable Bluetooth speaker with great sound quality.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Smart Watch',
    productPrice: 199.99,
    productRate: 4.7,
    productImage:
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
    productDes:
        'Track your fitness and receive notifications on this smart watch.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Gaming Laptop',
    productPrice: 999.99,
    productRate: 4.8,
    productImage: 'https://images.unsplash.com/photo-1542751371-adc38448a05e',
    productDes: 'Powerful gaming laptop with the latest GPU and CPU.',
  ),
  Product(
    productType: ProductType.electric,
    productName: '4K TV',
    productPrice: 699.99,
    productRate: 4.6,
    productImage:
        'https://images.unsplash.com/photo-1467296586487-aea57ae5a201',
    productDes: 'Enjoy movies and shows in high definition with this 4K TV.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Smartphone',
    productPrice: 799.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb',
    productDes: 'Latest smartphone with amazing features and camera quality.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Electric Kettle',
    productPrice: 29.99,
    productRate: 4.3,
    productImage:
        'https://images.unsplash.com/photo-1596755094514-f87e34085b2c',
    productDes: 'Fast boiling electric kettle for your daily needs.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Noise Cancelling Headphones',
    productPrice: 129.99,
    productRate: 4.9,
    productImage:
        'https://images.unsplash.com/photo-1618366712010-f4ae9c647dc5',
    productDes: 'Noise cancelling headphones for a peaceful experience.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Electric Toothbrush',
    productPrice: 39.99,
    productRate: 4.7,
    productImage:
        'https://images.unsplash.com/photo-1626248801379-51a0748a5f96',
    productDes: 'High-tech electric toothbrush for better dental hygiene.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Smart Light Bulb',
    productPrice: 19.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1517486808906-6ca8b3f8e1c1',
    productDes: 'Control the lighting with your phone using this smart bulb.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Robot Vacuum Cleaner',
    productPrice: 299.99,
    productRate: 4.8,
    productImage:
        'https://images.unsplash.com/photo-1588943211346-0908a1fb0b01',
    productDes:
        'Automatic vacuum cleaner to keep your floors clean effortlessly.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Blender',
    productPrice: 59.99,
    productRate: 4.3,
    productImage: 'https://images.unsplash.com/photo-1560518883-ce09059eeffa',
    productDes:
        'Blend your favorite smoothies and shakes with this powerful blender.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Wireless Charger',
    productPrice: 19.99,
    productRate: 4.7,
    productImage:
        'https://images.unsplash.com/photo-1587033411394-45a8433c2a2e',
    productDes: 'Wireless charging pad for fast and efficient charging.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Fitness Tracker',
    productPrice: 49.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1576243349700-4a9851a13d17',
    productDes: 'Track your fitness progress with this sleek fitness tracker.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Electric Fan',
    productPrice: 39.99,
    productRate: 4.2,
    productImage: 'https://images.unsplash.com/photo-1560769629-975ec94e6a86',
    productDes: 'Portable electric fan for staying cool during hot days.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Portable Power Bank',
    productPrice: 29.99,
    productRate: 4.6,
    productImage:
        'https://images.unsplash.com/photo-1574944985070-8f3ebc6b79d2',
    productDes: 'Keep your devices charged with this portable power bank.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Electric Grill',
    productPrice: 129.99,
    productRate: 4.4,
    productImage:
        'https://images.unsplash.com/photo-1601050690597-df0568f70950',
    productDes: 'Cook delicious meals with this compact electric grill.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Camera Tripod',
    productPrice: 49.99,
    productRate: 4.8,
    productImage:
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32',
    productDes: 'Stable tripod for capturing perfect shots and videos.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Laptop Stand',
    productPrice: 25.99,
    productRate: 4.4,
    productImage:
        'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd',
    productDes: 'Ergonomic laptop stand for comfortable working posture.',
  ),
  Product(
    productType: ProductType.electric,
    productName: 'Smart Thermostat',
    productPrice: 149.99,
    productRate: 4.6,
    productImage: 'https://images.unsplash.com/photo-1556740738-b6a63e27c4df',
    productDes:
        'Control your home temperature remotely with this smart thermostat.',
  ),

  // Clothing (cloth)
  Product(
    productType: ProductType.cloth,
    productName: 'Cotton T-Shirt',
    productPrice: 19.99,
    productRate: 4.3,
    productImage:
        'https://images.unsplash.com/photo-1576566588028-4147f3842f27',
    productDes: 'Comfortable cotton t-shirt available in multiple colors.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Denim Jeans',
    productPrice: 49.99,
    productRate: 4.5,
    productImage: 'https://images.unsplash.com/photo-1542272604-787c3835535d',
    productDes: 'Classic denim jeans with a modern fit.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Hooded Sweatshirt',
    productPrice: 39.99,
    productRate: 4.4,
    productImage:
        'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9',
    productDes: 'Warm and comfortable hooded sweatshirt for casual wear.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Leather Jacket',
    productPrice: 199.99,
    productRate: 4.7,
    productImage: 'https://images.unsplash.com/photo-1551028719-00167b16eac5',
    productDes: 'Premium quality leather jacket for a stylish look.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Running Shorts',
    productPrice: 24.99,
    productRate: 4.2,
    productImage:
        'https://images.unsplash.com/photo-1591047139829-d91aecb6caea',
    productDes: 'Lightweight running shorts with moisture-wicking fabric.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Wool Sweater',
    productPrice: 59.99,
    productRate: 4.6,
    productImage:
        'https://images.unsplash.com/photo-1527719327859-c6ce80353573',
    productDes: 'Warm wool sweater for cold weather.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Silk Scarf',
    productPrice: 29.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
    productDes: 'Elegant silk scarf for any occasion.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Winter Coat',
    productPrice: 149.99,
    productRate: 4.8,
    productImage:
        'https://images.unsplash.com/photo-1539533018447-63fcce2678e4',
    productDes: 'Heavy winter coat with insulation for extreme cold.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Yoga Pants',
    productPrice: 34.99,
    productRate: 4.7,
    productImage:
        'https://images.unsplash.com/photo-1584483766114-2cea6facdf57',
    productDes: 'Stretchy and comfortable yoga pants for workouts.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Formal Dress Shirt',
    productPrice: 44.99,
    productRate: 4.4,
    productImage:
        'https://images.unsplash.com/photo-1598033129183-c4f50c736f10',
    productDes: 'Crisp formal dress shirt for business occasions.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Swim Trunks',
    productPrice: 27.99,
    productRate: 4.3,
    productImage:
        'https://images.unsplash.com/photo-1590845947676-fa2576f401d4',
    productDes: 'Quick-dry swim trunks for the beach or pool.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Cashmere Sweater',
    productPrice: 129.99,
    productRate: 4.9,
    productImage:
        'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3',
    productDes: 'Luxurious cashmere sweater for ultimate comfort.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Baseball Cap',
    productPrice: 19.99,
    productRate: 4.2,
    productImage:
        'https://images.unsplash.com/photo-1521369909029-2afed882baee',
    productDes: 'Classic baseball cap with adjustable strap.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Pajama Set',
    productPrice: 39.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1595341595379-cf0b1f3d7e0a',
    productDes: 'Comfortable pajama set for a good night\'s sleep.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Trench Coat',
    productPrice: 179.99,
    productRate: 4.7,
    productImage:
        'https://images.unsplash.com/photo-1591047139829-d91aecb6caea',
    productDes: 'Stylish trench coat for rainy days.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Athletic Socks',
    productPrice: 12.99,
    productRate: 4.3,
    productImage: 'https://images.unsplash.com/photo-1543163521-1bf539c55dd2',
    productDes: 'Pack of 3 pairs of comfortable athletic socks.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Knit Beanie',
    productPrice: 14.99,
    productRate: 4.4,
    productImage:
        'https://images.unsplash.com/photo-1534215754734-18e55d13e346',
    productDes: 'Warm knit beanie for cold weather.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Linen Shirt',
    productPrice: 49.99,
    productRate: 4.6,
    productImage:
        'https://images.unsplash.com/photo-1598033129183-c4f50c736f10',
    productDes: 'Breathable linen shirt for summer.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Fleece Jacket',
    productPrice: 59.99,
    productRate: 4.5,
    productImage: 'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3',
    productDes: 'Lightweight fleece jacket for cool days.',
  ),
  Product(
    productType: ProductType.cloth,
    productName: 'Dress Pants',
    productPrice: 69.99,
    productRate: 4.4,
    productImage:
        'https://images.unsplash.com/photo-1598033129183-c4f50c736f10',
    productDes: 'Classic dress pants for formal occasions.',
  ),

  // Accessories (accessory)
  Product(
    productType: ProductType.accessory,
    productName: 'Leather Wallet',
    productPrice: 49.99,
    productRate: 4.5,
    productImage: 'https://images.unsplash.com/photo-1549923746-c502d488b3ea',
    productDes: 'Genuine leather wallet with multiple card slots.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Sunglasses',
    productPrice: 89.99,
    productRate: 4.6,
    productImage:
        'https://images.unsplash.com/photo-1511499767150-a48a237f0083',
    productDes: 'UV protection sunglasses with polarized lenses.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Stainless Steel Watch',
    productPrice: 149.99,
    productRate: 4.7,
    productImage:
        'https://images.unsplash.com/photo-1523170335258-f5ed11844a49',
    productDes: 'Elegant stainless steel watch with date display.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Canvas Backpack',
    productPrice: 59.99,
    productRate: 4.4,
    productImage: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
    productDes: 'Durable canvas backpack with laptop compartment.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Leather Belt',
    productPrice: 39.99,
    productRate: 4.3,
    productImage:
        'https://images.unsplash.com/photo-1584917865442-de89df76afd3',
    productDes: 'Genuine leather belt with stainless steel buckle.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Silk Tie',
    productPrice: 29.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
    productDes: 'Elegant silk tie for formal occasions.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Travel Neck Pillow',
    productPrice: 19.99,
    productRate: 4.2,
    productImage:
        'https://images.unsplash.com/photo-1589998059171-988d887df646',
    productDes: 'Comfortable neck pillow for long flights.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Leather Gloves',
    productPrice: 49.99,
    productRate: 4.6,
    productImage:
        'https://images.unsplash.com/photo-1595341595379-cf0b1f3d7e0a',
    productDes: 'Warm leather gloves for winter.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Stainless Steel Water Bottle',
    productPrice: 24.99,
    productRate: 4.7,
    productImage:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8',
    productDes:
        'Insulated stainless steel water bottle keeps drinks cold for 24 hours.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Keychain',
    productPrice: 9.99,
    productRate: 4.1,
    productImage:
        'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
    productDes: 'Durable metal keychain with leather tag.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Canvas Tote Bag',
    productPrice: 19.99,
    productRate: 4.3,
    productImage: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
    productDes: 'Stylish canvas tote bag for everyday use.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Wooden Watch',
    productPrice: 79.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1524805444758-089113d48a6d',
    productDes: 'Eco-friendly wooden watch with leather strap.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Silver Cufflinks',
    productPrice: 59.99,
    productRate: 4.6,
    productImage:
        'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
    productDes: 'Elegant silver cufflinks for formal shirts.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Leather Passport Holder',
    productPrice: 34.99,
    productRate: 4.4,
    productImage: 'https://images.unsplash.com/photo-1549923746-c502d488b3ea',
    productDes: 'Genuine leather passport holder with card slots.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Cashmere Scarf',
    productPrice: 89.99,
    productRate: 4.8,
    productImage:
        'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
    productDes: 'Luxurious cashmere scarf for winter.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Metal Business Card Holder',
    productPrice: 19.99,
    productRate: 4.3,
    productImage:
        'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
    productDes: 'Sleek metal business card holder.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Leather Briefcase',
    productPrice: 199.99,
    productRate: 4.7,
    productImage: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
    productDes: 'Professional leather briefcase for work.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Stainless Steel Flask',
    productPrice: 29.99,
    productRate: 4.5,
    productImage:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8',
    productDes: 'Compact stainless steel flask for beverages.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Cotton Bandana',
    productPrice: 12.99,
    productRate: 4.2,
    productImage:
        'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91',
    productDes: 'Stylish cotton bandana in various colors.',
  ),
  Product(
    productType: ProductType.accessory,
    productName: 'Leather Key Organizer',
    productPrice: 39.99,
    productRate: 4.6,
    productImage: 'https://images.unsplash.com/photo-1549923746-c502d488b3ea',
    productDes: 'Compact leather key organizer to keep keys tidy.',
  ),
];
