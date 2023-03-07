import 'package:ecommerceapp/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OnbaordPage extends StatelessWidget {
  const OnbaordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Ecommerce UI'),
        //   centerTitle: true,
        // ),
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "assets/images/bg1.png",
          fit: BoxFit.cover,
        ),
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.fromLTRB(30, 30, 30, 15),
          height: 230,
          decoration: BoxDecoration(
            // color: Color.fromRGBO(226, 26, 39, 100),
            color: Color(0xffE21A27),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Text(
                'Find everything youneed for sports',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Buy store, trade, exchange, learn and earn crypto witha a single tap. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    backgroundColor: Color(0xff414143),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BasePage(),
                        ));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
