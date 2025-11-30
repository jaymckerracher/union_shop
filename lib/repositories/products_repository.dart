import '../models/product_model.dart';

class ProductsRepository {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'Classic Beanie',
      description:
          'Stay warm and stylish with our Classic Beanie. Made from soft, high-quality materials, it offers comfort and durability for everyday wear. Available in a range of colors to match any outfit.',
      price: 12.00,
      imageUrls: [
        '../assets/images/classic_beanie/black.webp',
        '../assets/images/classic_beanie/green.webp',
        '../assets/images/classic_beanie/purple.webp',
        '../assets/images/classic_beanie/white.webp',
      ],
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '2',
      title: 'Classic Cap',
      description:
          'Shield your eyes from the sun with our Classic Cap. This timeless accessory features a comfortable fit and adjustable strap, perfect for any casual occasion. Choose your favorite color to complete your look.',
      price: 12.00,
      imageUrls: [
        '../assets/images/classic_cap/black.webp',
        '../assets/images/classic_cap/green.webp',
        '../assets/images/classic_cap/grey.webp',
        '../assets/images/classic_cap/purple.webp',
      ],
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '3',
      title: 'Classic Hoodie',
      description:
          'Our Classic Hoodie is designed for both comfort and style. Crafted from cozy fabric, it’s perfect for layering on chilly days. Available in multiple colors to suit your personal taste.',
      price: 25.00,
      imageUrls: [
        '../assets/images/classic_hoodie/blue.webp',
        '../assets/images/classic_hoodie/green.webp',
        '../assets/images/classic_hoodie/grey.webp',
        '../assets/images/classic_hoodie/purple.webp',
      ],
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '4',
      title: 'Classic Rainbow Hoodie',
      description:
          'Celebrate diversity with the Classic Rainbow Hoodie. Featuring a bold rainbow design, this hoodie is soft, warm, and perfect for making a statement. Limited edition—grab yours while supplies last!',
      price: 12.99,
      imageUrls: [
        '../assets/images/classic_rainbow_hoodie/black.webp',
      ],
      originalPrice: 30.00,
      promoMessage: 'This is a sample promo message.',
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '5',
      title: 'Classic Sweatshirt',
      description:
          'The Classic Sweatshirt is your go-to for relaxed comfort. Its soft material and classic fit make it ideal for lounging or casual outings. Mix and match with your favorite jeans or joggers.',
      price: 23.00,
      imageUrls: [
        '../assets/images/classic_sweatshirt/black.webp',
        '../assets/images/classic_sweatshirt/green.webp',
        '../assets/images/classic_sweatshirt/grey.webp',
        '../assets/images/classic_sweatshirt/purple.webp',
      ],
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '6',
      title: 'Classic Tee',
      description:
          'Keep it simple and stylish with our Classic Tee. Made from breathable cotton, this t-shirt is perfect for everyday wear. Available in a variety of colors for easy pairing.',
      price: 11.00,
      imageUrls: [
        '../assets/images/classic_tee/black.webp',
        '../assets/images/classic_tee/blue.webp',
        '../assets/images/classic_tee/purple.webp',
        '../assets/images/classic_tee/white.webp',
      ],
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '7',
      title: 'Essential Tee',
      description:
          'The Essential Tee is a wardrobe staple for any season. Lightweight and comfortable, it’s great for layering or wearing on its own. Enjoy its classic fit and affordable price.',
      price: 6.99,
      imageUrls: [
        '../assets/images/essential_tee/blue.webp',
        '../assets/images/essential_tee/green.webp',
      ],
      originalPrice: 10.00,
      promoMessage: 'This is a sample promo message.',
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '8',
      title: 'Graduation Hoodie',
      description:
          'Celebrate your achievements with the Graduation Hoodie. Designed for graduates, it’s a cozy reminder of your special day. Soft, durable, and perfect for lasting memories.',
      price: 35.00,
      imageUrls: [
        '../assets/images/grad_hoodie/grey.webp',
        '../assets/images/grad_hoodie/purple.webp',
      ],
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '9',
      title: 'Signature Hoodie',
      description:
          'Show off your style with the Signature Hoodie. This premium hoodie features a unique signature design and is made from high-quality materials. Stay warm and fashionable all year round.',
      price: 32.99,
      imageUrls: [
        '../assets/images/signature_hoodie/green.webp',
        '../assets/images/signature_hoodie/white.webp',
      ],
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '10',
      title: 'Signature Tee',
      description:
          'The Signature Tee combines comfort with a touch of flair. Its signature print stands out while the soft fabric keeps you comfortable. Perfect for casual days or layering.',
      price: 14.99,
      imageUrls: [
        '../assets/images/signature_tee/blue.webp',
        '../assets/images/signature_tee/white.webp',
      ],
      category: ProductCategory.clothing,
      collections: [],
    ),
    Product(
      id: '11',
      title: 'Cotton Tote Bag',
      description:
          'Carry your essentials in style with our Cotton Tote Bag. Lightweight and eco-friendly, it’s perfect for shopping, school, or the gym. A practical accessory for everyday use.',
      price: 1.99,
      imageUrls: [
        '../assets/images/merch/cotton_tote.webp',
      ],
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '12',
      title: 'Crested Tie',
      description:
          'Add a touch of class to your outfit with the Crested Tie. Featuring a distinguished crest, this tie is perfect for formal events or professional settings. Made from quality materials for a polished look.',
      price: 10.99,
      imageUrls: [
        '../assets/images/merch/crested_tie.webp',
      ],
      originalPrice: 15.00,
      promoMessage: 'This is a sample promo message.',
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '13',
      title: 'Halloween Tote Bag',
      description:
          'Get into the spooky spirit with the Halloween Tote Bag. This fun and festive bag is great for trick-or-treating or carrying your daily essentials. Durable and reusable for every Halloween season.',
      price: 2.50,
      imageUrls: [
        '../assets/images/merch/halloween_tote.webp',
      ],
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '14',
      title: 'ID Holder',
      description:
          'Keep your ID safe and accessible with our ID Holder. Compact and convenient, it’s ideal for students and professionals alike. Attach it to your lanyard or bag for easy access.',
      price: 0.75,
      imageUrls: [
        '../assets/images/merch/id_holder.webp',
      ],
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '15',
      title: 'Lanyard',
      description:
          'Our Lanyard is a must-have for keeping keys, badges, or ID cards secure. Made from sturdy material, it’s comfortable to wear all day. Choose from a variety of colors to suit your style.',
      price: 2.75,
      imageUrls: [
        '../assets/images/merch/lanyard.webp',
      ],
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '16',
      title: 'Portsmouth City Magnet',
      description:
          'Show your love for Portsmouth with the City Magnet. This vibrant magnet is a great souvenir or gift, perfect for decorating your fridge or locker. Collect them all from our city series.',
      price: 4.50,
      imageUrls: [
        '../assets/images/merch/magnet.webp',
      ],
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '17',
      title: 'Pen',
      description:
          'Write in style with our branded Pen. Smooth ink flow and a comfortable grip make it ideal for school, work, or home. A simple yet essential addition to your stationery collection.',
      price: 1.00,
      imageUrls: [
        '../assets/images/merch/pen.webp',
      ],
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '18',
      title: 'Portsmouth City Postcard',
      description:
          'Send a piece of Portsmouth with our City Postcard. Featuring a beautiful cityscape, it’s perfect for sending greetings or keeping as a memento. High-quality print for lasting memories.',
      price: 1.00,
      imageUrls: [
        '../assets/images/merch/postcard.webp',
      ],
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '19',
      title: 'Rainbow Lanyard',
      description:
          'Brighten up your day with the Rainbow Lanyard. Its colorful design makes it easy to spot and fun to wear. Great for keys, badges, or as a statement accessory.',
      price: 2.75,
      imageUrls: [
        '../assets/images/merch/rainbow_lanyard.webp',
      ],
      category: ProductCategory.merchandise,
      collections: [],
    ),
    Product(
      id: '20',
      title: '8GB USB',
      description:
          'Store your files securely with our 8GB USB. Compact and reliable, it’s perfect for students and professionals on the go. Comes with a protective cap to keep your data safe.',
      price: 5.50,
      imageUrls: [
        '../assets/images/merch/usb.webp',
      ],
      originalPrice: 7.50,
      promoMessage: 'This is a sample promo message.',
      category: ProductCategory.merchandise,
      collections: [],
    ),
  ];
}
