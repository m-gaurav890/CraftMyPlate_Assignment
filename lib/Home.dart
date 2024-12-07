import 'package:craft_my_plate_assignment/breakfastMenuScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    // SliverAppBar for the image and floating buttons
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      expandedHeight: 250,
                      floating: false,
                      pinned: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            // Background Image
                            Image.asset(
                              'assets/marraige.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            // Title "Wedding"
                            Positioned(
                              bottom: 200,
                              left: 5,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110,
                                  ),
                                  Text(
                                    'Wedding',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 3,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Floating Buttons
                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildFloatingButton(
                                      'Bulk Food Delivery', true),
                                  _buildFloatingButton(
                                      'Catering Service', false),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // TabBar included as part of the scrollable content
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        child: TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.purple,
                          labelColor: Colors.purple,
                          unselectedLabelColor: Colors.black54,
                          tabs: [
                            Tab(text: 'ALL (8)'),
                            Tab(text: 'Breakfast'),
                            Tab(text: 'Lunch & Dinner'),
                            Tab(text: 'Snacks'),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BreakfastMenuScreen()));
                      },
                      child: _buildFoodList(),
                    ),
                    _buildFoodList(),
                    _buildFoodList(),
                    _buildFoodList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingButton(String title, bool isSelected) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0XFFFFFFFF) : Color(0XFFE4E6E7),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Color(0XFF6318AF) : Color(0XFF60666C),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFoodList() {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildFoodCard();
      },
    );
  }

  Widget _buildFoodCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Image.asset(
            'assets/food.png',
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 0,
              top: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0XFFA300A3), Color(0XFF0B003D)]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22),
                        bottomRight: Radius.circular(22))),
                child: Row(
                  children: [
                    Text(
                      "Best for diwali pooja",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )),
          Positioned(
              right: 0,
              bottom: 200,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                decoration: BoxDecoration(
                    color: Color(0XFFFFFFFF).withOpacity(0.8),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(12))),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Color(0XFF484C51),
                    ),
                    Text("Min 10 - Max 120")
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Indian Soiree',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('7 Categories & 12 Items'),
                      // Scrollable images in a horizontal row with circular shapes and orange border
                      SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(7, (index) {
                            return Container(
                              width: 70,
                              // Image size
                              height: 70,
                              // Image size
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.orange, // Orange border
                                  width: 3, // Border thickness
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/bowl.png',
                                  width: 60, // Fit inside the circle
                                  height: 60,
                                  fit: BoxFit.cover,
                                  alignment:
                                      Alignment.topCenter, // Show the top part
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 8),
                      const Divider(
                        color: Color(0XFFE4E6E7),
                        height: 1,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: '₹299', // The price part
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Colors.black, // Default color for price
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '/guest', // The "/guest" part
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                            0xFF484C51), // Color for "/guest"
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              // Add some space between the two lines
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // "Add guest count to see" Text
                                  Text(
                                    'Add guest count to see',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(
                                          0xFF60666C), // Updated color for the additional line
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  // Space between the text and the star icon
                                  // Star Icon and "Dynamic Price" text
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        // Yellow star icon
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      // Space between the icon and the text
                                      Text(
                                        'Dynamic Price',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF6318AF),
                                          // Color for "Dynamic Price"
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6318AF),
                              // Updated color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Optional: keep rounded edges
                              ),
                            ),
                            child: const Text(
                              'Customize',
                              style: TextStyle(
                                  color:
                                      Colors.white), // Set text color to white
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
