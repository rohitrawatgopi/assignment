import 'package:assignment/features/home/ui/home.dart';
import 'package:assignment/features/search/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomScreen extends StatefulWidget {
  BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int currentValue = 0;

  List<Widget> screenList = [HomeScreen(), SearchScreen()];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Color(0xffF9F9F9),
      ),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentValue,
            selectedFontSize: 12,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: currentValue == 0 ? Colors.white : Colors.grey,
                  size: 30,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: currentValue == 1 ? Colors.white : Colors.grey,
                  size: 30,
                ),
                label: 'Search',
                tooltip: 'Search for content',
              ),
            ],
            onTap: (index) {
              setState(() {
                currentValue = index;
              });
            },
          ),
          body: screenList[currentValue],
        ),
      ),
    );
  }
}
