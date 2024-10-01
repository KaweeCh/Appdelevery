import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  String searchQuery = ''; // Holds the search query
  late TabController _tabController;

  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'กระเพราหมูกรอบ',
      'rating': 4.8,
      'description': 'กระเพราะหมูกรอบแสนอร่อย',
      'imageUrl':
          'https://img.wongnai.com/p/1920x0/2021/01/17/c95146b336274b0283b92b6943d289d8.jpg',
      'quantity': 1,
      'status': 'กำลังจัดส่ง'
    },
    {
      'name': 'กระเพราหมูสับไข่ดาว',
      'rating': 4.8,
      'description': 'กระเพราหมูสับไข่ดาวแสนอร่อย',
      'imageUrl': 'https://images.deliveryhero.io/image/fd-th/LH/ci6d-hero.jpg',
      'quantity': 1,
      'status': 'รับสินค้าและกำลังเดินทาง'
    },
    {
      'name': 'กระเพราหมูกรอบเทพเจ้าดาวเหนือ',
      'rating': 4.8,
      'description': 'กระเพราหมูกรอบเทพ',
      'imageUrl':
          'https://www.ryoiireview.com/upload/article/202003/1584433400_3cabc1dc52dc70069b84deed66aafa0a.jpg',
      'quantity': 1,
      'status': 'นำส่งสินค้าแล้ว'
    },
    // Add more items here...
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'อาหาร'), // Food
            Tab(text: 'ออเดอร์'), // Order
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildFoodList(),
          buildOrderSummary(), // Placeholder for order summary
        ],
      ),
    );
  }

  Widget buildFoodList() {
    // Filter the menu items based on the search query
    List<Map<String, dynamic>> filteredItems = menuItems
        .where((item) =>
            item['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
            item['description']
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        // Search bar
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(255, 75, 161, 72),
              width: 3,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // Update search query on change
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.search, color: Color.fromARGB(255, 75, 161, 72)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              final item = filteredItems[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            item['imageUrl'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(item['description']),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('${item['rating']}'),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Show confirmation dialog before deletion
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Confirm Delete'),
                                        content: Text(
                                            'Are you sure you want to delete this item?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Dismiss the dialog
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Handle delete action here
                                              setState(() {
                                                menuItems.removeAt(
                                                    index); // Remove item from list
                                              });
                                              Navigator.of(context)
                                                  .pop(); // Dismiss the dialog
                                            },
                                            child: Text('Delete',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.red, // Background color
                                ),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildOrderSummary() {
    // Filter the menu items based on the search query
    List<Map<String, dynamic>> filteredItems = menuItems
        .where((item) =>
            item['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
            item['description']
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        // Search bar
        Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromARGB(255, 75, 161, 72),
              width: 3,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // Update search query on change
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.search, color: Color.fromARGB(255, 75, 161, 72)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              final item = filteredItems[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            item['imageUrl'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${item['name']} x ${item['quantity']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                        Icons.share_location,
                                        color: Colors
                                            .green, // Change color to indicate it's inactive
                                      ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('099-991-9991'),
                                    TextButton(
                                      onPressed: () {
                                        // Handle button press here
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          text:
                                              '${item['status']}', // Display the status of the item
                                          style: TextStyle(
                                            color: Colors
                                                .green, // Set text color to green
                                            decoration: TextDecoration
                                                .underline, // Set text decoration to underline
                                            decorationColor: Colors
                                                .green, // Change the color of the underline
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
