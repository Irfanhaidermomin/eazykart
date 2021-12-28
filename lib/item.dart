import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Item {
  String id;
  String name;
  String description;
  int price;
  bool inStock;
  String imageUrl;

  Item(
      {required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.inStock,
        required this.imageUrl});

  String get formattedAvailability => inStock ? "Available" : "Out of stock";
  String get formattedPrice => Item.formatter.format(this.price);
  Color get availabilityColor => inStock ? Colors.grey : Colors.red;

  static final formatter =
  NumberFormat.currency(locale: 'id_ID', symbol: "Rs ");

  static List<Item> get dummyItems => [
    Item(
      id: "1",
      name: "Olive Oil          ",
      description: 'More magical than ever.',
      price: 500,
      inStock: true,
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLFfjir12qivOk-XQwOEmcPLrZilj4al7L8g&usqp=CAU',
    ),
    Item(
      id: "2",
      name: "Maggie          ",
      description: 'More magical than ever.',
      price: 10,
      inStock: false,
      imageUrl:'https://rukminim1.flixcart.com/image/416/416/ki3gknk0/noodle/z/l/u/840-maggie-masala-noodles-12-instant-noodles-nestle-original-imafxym3qfnvhksa.jpeg?q=70',
    ),
    Item(
      id: "3",
      name: "Ashirwaad Whole Wheat Grain       ",
      description: 'More magical than ever.',
      price: 200,
      inStock: false,
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm2LsLtrMmVKasA5Wo_GtYetWRH5gSj8ZLpA&usqp=CAU',
    ),
    Item(
      id: "4",
      name: "5 Biscuits Combo         ",
      description: 'More magical than ever.',
      price: 250,
      inStock: true,
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJPtBAe8jizbaCV8M8TqPnN3GdAbZ6ooEWJQ&usqp=CAU',
    ),
    Item(
      id: "5",
      name: "Mineral Water         ",
      description: 'More magical than ever.',
      price: 130,
      inStock: true,
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjNXuHwBRusUKSkf007oRiMHxNmEQcXREPRw&usqp=CAU',
    ),

  ];
}