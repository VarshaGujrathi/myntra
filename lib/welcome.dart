import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart'; 
import 'scroll.dart';// Import your login.dart file

void main() {
  runApp(MaterialApp(
    home: WelcomePage(),
  ));
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  late Timer _timer;
  int _selectedIndex = 0;

  final List<String> _images = [
    'assets/gofor.jpeg',
    'assets/scale.avif',
    'assets/kids.webp',
    'assets/foot.webp',
    'assets/coldskin.avif',
    'assets/bags.jpg',
  ];

  final List<String> _additionalImages = [
    'assets/girls.jpeg',
    'assets/allen.jpeg',
    'assets/vero.jpeg',
    'assets/bata.jpeg',
  ];

  final List<String> _rowSliderImages = [
    'assets/ninety.jpg',
    'assets/twenty.jpg',
    'assets/thirty.jpg',
    'assets/fourty.jpg',
  ];

  final List<String> _under199ImagesTopRow = [
    'assets/footcat.jpg',
    'assets/kurtacat.jpg',
    'assets/kurticat.jpg',
    'assets/lipcat.webp',
    'assets/moistcat.jpg',
    'assets/shirtcat.jpg',
    'assets/shirtcatm.jpg',
    'assets/tshirtcatw.jpg',
    'assets/watchcat.jpg',
  ];

  final List<String> _under199ImagesBottomRow = [
    'assets/bedcat.jpeg',
    'assets/cascat.jpeg',
    'assets/flipcat.jpeg',
    'assets/jeanscat.jpeg',
    'assets/kiddrcat.webp',
    'assets/shampcat.jpeg',
    'assets/shortcat.jpg',
    'assets/sportcat.webp',
    'assets/trackcat.avif',
    'assets/trollycat.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_pageController.hasClients) {
        if (_pageController.page == _images.length - 1) {
          _pageController.jumpToPage(0);
        } else {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: _buildDropdownButton(context),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: Icon(Icons.account_circle, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),

              // Build your search bar widget
              _buildSearchBar(),

              SizedBox(height: 20.0),

              // Build your button row widget
              _buildButtonRow(),

              SizedBox(height: 20.0),

              // Build your image carousel widget
              _buildImageCarousel(),

              SizedBox(height: 10.0),

              // Build your additional images row widget
              _buildAdditionalImagesRow(),

              SizedBox(height: 20.0),

              // Build your row slider images widget
              _buildRowSliderImages(),

              SizedBox(height: 20.0),

              // Build your under 199 images widgets
              _buildUnder199Images(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/logo.webp', width: 24.0, height: 24.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            label: 'TrendNxt',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
        ],
      ),
    );
  }

 Widget _buildDropdownButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScrollPage()),
      );
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 230, 219),
        border: Border.all(color: Color.fromARGB(255, 235, 204, 171), width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Myntra',
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(width: 8.0),
          Icon(Icons.arrow_drop_down, color: Colors.black),
        ],
      ),
    ),
  );
}


  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[600]),
          SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Icon(Icons.camera_alt),
          SizedBox(width: 10.0),
          Icon(Icons.mic),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildSquareButton('Men', 'assets/men.webp'),
          SizedBox(width: 10.0),
          _buildSquareButton('Women', 'assets/women.jpg'),
          SizedBox(width: 10.0),
          _buildSquareButton('Kids', 'assets/both.webp'),
          SizedBox(width: 10.0),
          _buildSquareButton('Footwear', 'assets/heels.jpg'),
          SizedBox(width: 10.0),
          _buildSquareButton('Accessories', 'assets/purse.webp'),
          SizedBox(width: 10.0),
          _buildSquareButton('Watches', 'assets/watch.jpg'),
          SizedBox(width: 10.0),
          _buildSquareButton('Luggage', 'assets/trolly.jpg'),
          SizedBox(width: 10.0),
          _buildSquareButton('Gadgets', 'assets/headphone.webp'),
          SizedBox(width: 10.0),
          _buildSquareButton('Jewellery', 'assets/jewel.webp'),
        ],
      ),
    );
  }

    Widget _buildSquareButton(String text, String imagePath) {
    return Column(
      children: [
        Container(
          width: 70.0, // Set the width of the square button
          height: 70.0, // Set the height of the square button
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            border: Border.all(color: Colors.black), // Border color
          ),
        ),
        SizedBox(height: 8.0), // Space between image and text
        Text(text, style: TextStyle(color: Colors.black)), // Button text
      ],
    );
  }


  Widget _buildImageCarousel() {
    return Container(
      height: 200.0,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              _images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildAdditionalImagesRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _additionalImages.map((imagePath) {
          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 180.0,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRowSliderImages() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _rowSliderImages.map((image) {
          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildUnder199Images() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUnder199Row(_under199ImagesTopRow),
        SizedBox(height: 10.0),
        _buildUnder199Row(_under199ImagesBottomRow),
      ],
    );
  }

  Widget _buildUnder199Row(List<String> images) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: images.map((image) {
          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    image,
                    width: 140.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: Center(
                      child: Text(
                        'Under 599/-',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}