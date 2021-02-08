import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui_starter/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; //use to set the selected icons
  int _currentTab = 0;

  //place to store icons
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  //icons controller
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        // print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4c1c4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 30.0), //add pading to vertical
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 20.0,
                    right: 120.0), //add padding to left and right of text
                child: Text(
                  'What would yout like to find?',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Space between
              SizedBox(height: 20.0),

              //The icons
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // add space between icons
                children: _icons
                    .asMap()
                    .entries
                    .map((MapEntry map) => _buildIcon(map.key))
                    .toList(), // make the icon iterable
              ),

              // TODO: dynamic destination depends on the selected icons

              SizedBox(height: 20.0),

              DestinationCarousel(),

              SizedBox(height: 20.0),

              HotelCarousel(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1340161454482182150/47Zph7Cw_400x400.jpg')),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
