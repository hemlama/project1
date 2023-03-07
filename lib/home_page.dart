import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/product_details.dart';
import 'package:ecommerceapp/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            RowIcon(),
            SizedBox(
              height: 40,

              // text we have prepared
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'We have prepared new Products',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: ' for you',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 28,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: ' ✌️',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // search text field
            Row(
              children: [
                Expanded(
                  child: Form(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        fillColor: Color(0xff707070),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          Text(
                            'This field is required',
                            style: TextStyle(color: Colors.red),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                iconWiget(
                  icon: Icons.filter,
                  onTap: () {},
                  ShowCircle: true,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Newest',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Popular',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Man',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Women',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),

            SizedBox(
              height: 25,
            ),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 160,
              ),
              itemCount: ProductModel.productLists.length,
              itemBuilder: (context, index) {
                var productDatas = ProductModel.productLists[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          productModel: productDatas,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 160,
                        width: 150,
                        imageUrl: productDatas.images.first),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// row icon widget
Widget RowIcon() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconWiget(icon: Icons.sort, onTap: () {}),
      iconWiget(icon: Icons.person, onTap: () {}),
    ],
  );
}

// icons widget

Widget iconWiget({
  required IconData icon,
  required Function() onTap,
  bool ShowCircle = false,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xff707070),
        borderRadius: ShowCircle ? null : BorderRadius.circular(10),
        shape: ShowCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    ),
  );
}
