import 'package:flutter/material.dart';
import 'dart:async';
import 'scroll.dart'; // Import the ScrollPage widget

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
  int _currentPage = 0;
  late Timer _timer;
  int _selectedIndex = 0; // Index of the currently selected bottom navigation item

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

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        setState(() {
          _currentPage++;
        });
      } else {
        setState(() {
          _currentPage = 0;
        });
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
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
        backgroundColor: Colors.white, // Set app bar background color to white
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 20.0), // Add padding to adjust the position
            child: _buildDropdownButton(context), // Custom dropdown button
          ),
          IconButton(
            onPressed: () {
              // Handle notification bell icon tap
            },
            icon: Icon(Icons.notifications, color: Colors.black), // Set icon color to black
          ),
          IconButton(
            onPressed: () {
              // Handle wishlist icon tap
            },
            icon: Icon(Icons.favorite, color: Colors.black), // Set icon color to black
          ),
          IconButton(
            onPressed: () {
              // Handle profile icon tap
            },
            icon: Icon(Icons.account_circle, color: Colors.black), // Set icon color to black
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Set background color of the body to white
          padding: EdgeInsets.all(16.0), // Add padding for content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0), // Reduced space between app bar and search bar

              // Search Bar with Icons
              _buildSearchBar(),

              SizedBox(height: 20.0), // Add space below search bar

              // Row of buttons
              _buildButtonRow(),

              SizedBox(height: 20.0), // Add space below button row

              // Image Carousel
              _buildImageCarousel(),

              SizedBox(height: 10.0), // Add space below image carousel

              // Text below carousel
              Center(
                child: Column(
                  children: [
                    Text(
                      'END OF SEASON STEALS',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 1.0), // Add space between texts
                    Text(
                      'Hottest Offers, Right This Way!',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.0), // Space before additional images
              _buildAdditionalImagesRow(), // Scrollable row of additional images

              SizedBox(height: 20.0), // Space before row slider images
              _buildRowSliderImages(), // Row slider of additional images

              // Add other content of the page here
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white, // Set background color to white
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex, // Track the selected index
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
          color: Color.fromARGB(255, 238, 230, 219), // Set background color to white
          border: Border.all(color: Color.fromARGB(255, 235, 204, 171), width: 2.0), // Yellow border
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Myntra',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            SizedBox(width: 8.0), // Add space between text and icon
            Icon(Icons.arrow_drop_down, color: Colors.black), // Dropdown icon
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Set background color for search bar
        borderRadius: BorderRadius.circular(20.0), // Set border radius
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding inside search bar
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[600]), // Magnifying glass icon
          SizedBox(width: 10.0), // Add space between magnifying glass icon and text field
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none, // Remove border
              ),
            ),
          ),
          SizedBox(width: 10.0), // Add space between search field and icons
          Icon(Icons.camera_alt), // Camera icon
          SizedBox(width: 10.0), // Add space between icons
          Icon(Icons.mic), // Speaker icon
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        children: [
          _buildSquareButton('Men', 'assets/men.webp'),
          SizedBox(width: 10.0), // Space between buttons
          _buildSquareButton('Women', 'assets/women.jpg'),
          SizedBox(width: 10.0), // Space between buttons
          _buildSquareButton('Kids', 'assets/both.webp'),
          SizedBox(width: 10.0), // Space between buttons
          _buildSquareButton('Footwear', 'assets/heels.jpg'),
          SizedBox(width: 10.0), // Space between buttons
          _buildSquareButton('Accessories', 'assets/purse.webp'),
          SizedBox(width: 10.0), // Space between buttons
          _buildSquareButton('Watches', 'assets/watch.jpg'),
          SizedBox(width: 10.0), // Space between buttons
          _buildSquareButton('Luggage', 'assets/trolly.jpg'),
          SizedBox(width: 10.0),
          _buildSquareButton('Gadgets', 'assets/headphone.webp'),
          SizedBox(width: 10.0), // Space between buttons
          _buildSquareButton('Jewellery', 'assets/jewel.webp'),
        ],
      ),
    );
  }

  Widget _buildSquareButton(String label, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4.0), // Add space between image and label
          Text(label, style: TextStyle(fontSize: 12.0)),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Container(
      height: 200.0, // Adjust height as needed
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            _images[index],
            fit: BoxFit.cover,
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
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 160.0,
                height: 200.0,
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
        children: _rowSliderImages.map((imagePath) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
