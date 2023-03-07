import 'package:ecommerceapp/home_page.dart';
import 'package:ecommerceapp/product_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currenPage = 0;
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: iconWiget(
            icon: Icons.keyboard_arrow_left,
            onTap: () {
              Navigator.pop(context);
            }),
        actions: [
          iconWiget(icon: Icons.favorite, onTap: () {}),
        ],
        backgroundColor: Color(0xff414141),
      ),
      backgroundColor: Color(0xff414141),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CarouselSlider(
                carouselController: carouselController,
                items: widget.productModel.images
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          imageUrl: e,
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  aspectRatio: 12 / 9,
                  autoPlay: false,
                  initialPage: currenPage,
                  onPageChanged: (value, reason) {
                    setState(() {
                      currenPage = value;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: 25,
                child: CarouselIndicator(
                  count: widget.productModel.images.length,
                  activeColor: Colors.red,
                  color: Colors.grey,
                  index: currenPage,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(23),
              padding: EdgeInsets.fromLTRB(35, 35, 35, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffE21A27),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productModel.productName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.productModel.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ...List.generate(
                            widget.productModel.colorList.length,
                            (index) => InkWell(
                              onTap: () {
                                carouselController.animateToPage(index);
                              },
                              child: Container(
                                padding: EdgeInsets.all(2.5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: currenPage == index
                                          ? Colors.black
                                          : Color(0xffE21A27)),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color:
                                          widget.productModel.colorList[index],
                                      shape: BoxShape.circle),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.productModel.quantity--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.productModel.quantity.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  widget.productModel.quantity++;
                                });
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '\$${widget.productModel.mainPrice.toStringAsFixed(0)}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.productModel.discountPrice
                                .toStringAsFixed(0),
                            style: TextStyle(
                                color: Color.fromARGB(255, 209, 208, 208),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                              backgroundColor: Color(0xff414143),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Add to cart',
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
