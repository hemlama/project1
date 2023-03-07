import 'package:flutter/material.dart';

class ProductModel {
  final String productName;
  final String description;
  final double mainPrice;
  final double discountPrice;
  int quantity;
  final List<String> images;
  final List<Color> colorList;

  ProductModel(
      {required this.productName,
      required this.description,
      required this.mainPrice,
      required this.discountPrice,
      required this.quantity,
      required this.images,
      required this.colorList});
  static List<ProductModel> productLists = [
    ProductModel(
        productName: "Bottle",
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique ',
        mainPrice: 29.00,
        discountPrice: 25,
        quantity: 2,
        images: [
          'https://i0.wp.com/post.healthline.com/wp-content/uploads/2022/05/2240520-11-Best-Yoga-Mats-to-Support-Your-Practice-in-2022-1296x728-Header-f0dec1.jpg?w=1155&h=1528',
          'https://cdn.webshopapp.com/shops/281654/files/399166574/image.jpg',
        ],
        colorList: [
          Colors.red,
          Colors.green,
        ]),
    ProductModel(
        productName: "Product2",
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique ',
        mainPrice: 60.00,
        discountPrice: 55,
        quantity: 2,
        images: [
          'https://cdn.runningshoesguru.com/wp-content/uploads/2020/02/running-shoes-reviews.jpg',
          'https://sasshoes-com.s3-us-west-2.amazonaws.com/img/SAS23-Sporty-Banner-feb23-mobile.jpg',
        ],
        colorList: [
          Colors.blue,
          Colors.yellow,
        ]),
    ProductModel(
        productName: "Product3",
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique ',
        mainPrice: 50.00,
        discountPrice: 40,
        quantity: 2,
        images: [
          'https://www.shutterstock.com/image-photo/woman-hand-perfect-coral-manicure-260nw-1397425193.jpg',
          'https://img.freepik.com/free-psd/black-friday-super-sale-web-banner-template_106176-1657.jpg?w=2000',
        ],
        colorList: [
          Colors.pink,
          Colors.black,
        ]),
    ProductModel(
        productName: "Product4",
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique ',
        mainPrice: 70.00,
        discountPrice: 60,
        quantity: 2,
        images: [
          'https://www.ukprinting.com/media/xigen/YmFubmVyaW1hZ2VzCg/images/w/a/water-bottles-mobile-banner-2.jpg',
          'https://www.antiquearchaeology.com/blog/wp-content/uploads/2017/09/white-water-bottles-banner.jpg',
        ],
        colorList: [
          Colors.blueGrey,
          Colors.cyan,
        ]),
  ];
}
