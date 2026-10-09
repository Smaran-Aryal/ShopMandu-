import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/product.dart';

const List<Category> categories = [
  Category(name: 'Electronics', icon: Icons.devices, color: Colors.blue),
  Category(name: 'Fashion', icon: Icons.checkroom, color: Colors.pink),
  Category(name: 'Shoes', icon: Icons.directions_run, color: Colors.green),
  Category(name: 'Beauty', icon: Icons.face_retouching_natural, color: Colors.purple),
  Category(name: 'Accessories', icon: Icons.watch, color: Colors.amber),
  Category(name: 'Home', icon: Icons.chair, color: Colors.teal),
];

final List<Product> products = [
  // Electronics
  Product(
    name: 'Wireless Headphones',
    category: 'Electronics',
    image: 'assets/images/headphone.webp',
    price: 3500,
    rating: 4.5,
    discount: 20,
    description:
        'Wireless Bluetooth headphones with high-quality sound, deep bass and up to 30 hours of battery life.',
  ),
  Product(
    name: 'Smart Watch',
    category: 'Electronics',
    image:'assets/images/smartwatch.webp',
    price: 5500,
    rating: 4.3,
    isNew: true,
    description:
        'Fitness smart watch with heart-rate monitor, step counter, sleep tracking and notifications.',
  ),
  Product(
    name: 'Laptop',
    category: 'Electronics',
    image: 'assets/images/laptop.webp',
    price: 85000,
    rating: 4.7,
    description:
        'Lightweight 15.6" laptop with a fast processor, 16GB RAM and 512GB SSD. Great for study and work.',
  ),
  // Fashion
  Product(
    name: 'Cotton T-Shirt',
    category: 'Fashion',
    image: 'assets/images/cotton.webp',
    price: 1200,
    rating: 4.2,
    discount: 15,
    description:
        'Soft, breathable 100% cotton t-shirt with a comfortable regular fit for everyday wear.',
  ),
  Product(
    name: 'Denim Jacket',
    category: 'Fashion',
    image: 'assets/images/denim.webp',
    price: 3800,
    rating: 4.4,
    isNew: true,
    description:
        'Classic denim jacket with a durable finish. Pairs well with almost any outfit.',
  ),
  // Shoes
  Product(
    name: 'Running Sneakers',
    category: 'Shoes',
    image: 'assets/images/sneakers.webp',
    price: 4500,
    rating: 4.6,
    discount: 10,
    description:
        'Lightweight running sneakers with a cushioned sole and breathable mesh upper.',
  ),
  Product(
    name: 'Leather Formal Shoes',
    category: 'Shoes',
    image: 'assets/images/formal.webp',
    price: 6200,
    rating: 4.3,
    description:
        'Elegant genuine-leather formal shoes with a comfortable insole for office and events.',
  ),
  // Beauty
  Product(
    name: 'Face Moisturizer',
    category: 'Beauty',
    image:'assets/images/moisturizer.webp',
    price: 1500,
    rating: 4.1,
    description:
        'Hydrating daily face moisturizer suitable for all skin types. Non-greasy formula.',
  ),
  Product(
    name: 'Matte Lipstick',
    category: 'Beauty',
    image: 'assets/images/matte.webp',
    price: 900,
    rating: 4.0,
    isNew: true,
    description:
        'Long-lasting matte lipstick with rich colour and a smooth, comfortable finish.',
  ),
  // Accessories
  Product(
    name: 'Travel Backpack',
    category: 'Accessories',
    image: 'assets/images/backpack.webp',
    price: 2800,
    rating: 4.5,
    description:
        'Spacious water-resistant backpack with a laptop compartment and padded shoulder straps.',
  ),
  Product(
    name: 'Sunglasses',
    category: 'Accessories',
    image: 'assets/images/sunglasses.webp',
    price: 1800,
    rating: 4.2,
    discount: 25,
    description:
        'Stylish UV400 protection sunglasses with a lightweight, durable frame.',
  ),
  // Home
  Product(
    name: 'Table Lamp',
    category: 'Home',
    image: 'assets/images/lamp.webp',
    price: 2200,
    rating: 4.4,
    description:
        'Modern LED table lamp with adjustable brightness. Perfect for your desk or bedside.',
  ),
  Product(
    name: 'Ceramic Mug Set',
    category: 'Home',
    image: 'assets/images/mugset.webp',
    price: 1100,
    rating: 4.3,
    isNew: true,
    description:
        'Set of 4 ceramic mugs with a glossy finish. Microwave and dishwasher safe.',
  ),
];

List<Product> productsByCategory(String categoryName) {
  if (categoryName == 'All') return products;
  return products.where((p) => p.category == categoryName).toList();
}

List<Product> popularProducts({int count = 6}) {
  final sorted = [...products]..sort((a, b) => b.rating.compareTo(a.rating));
  return sorted.take(count).toList();
}
