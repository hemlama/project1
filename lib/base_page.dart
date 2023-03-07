import 'package:ecommerceapp/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  static const List<Widget> Screens = [
    HomePage(),
    Text('Shop Pressed'),
    Text('Faforate pressed'),
    Text('Settings Page Pressed')
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Are you sure to exit this app?'),
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                icon: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.clear),
                  ),
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Ok'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('No'),
                    ),
                  ],
                ),
              );
            });

        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xff414141),
        // appBar: AppBar(
        //   title: Text(
        //     'Ecommerce UI',
        //   ),
        //   centerTitle: true,
        // ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color(0xff707070),
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                  print(selectedIndex);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                    activeIcon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shop_outlined),
                    label: 'Shop',
                    activeIcon: Icon(Icons.shop),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline),
                    label: 'Fabourate',
                    activeIcon: Icon(Icons.favorite),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined),
                    label: 'Settings',
                    activeIcon: Icon(Icons.settings),
                  ),
                ]),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Screens[selectedIndex],
            ],
          ),
        ),
      ),
    );
  }
}
