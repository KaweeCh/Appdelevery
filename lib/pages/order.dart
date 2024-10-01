import 'package:flutter/material.dart';
import 'package:last/pages/bill.dart';
import 'package:last/pages/userchat.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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

  String searchQuery = ''; // Holds the search query

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredItems = menuItems
        .where((item) =>
            item['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
            item['description']
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: Column(
        children: [
          // Search bar
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 30, left: 10, right: 10),
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

          // Menu List
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length, // Use the filtered list length
              itemBuilder: (context, index) {
                final item = filteredItems[index]; // Get the current item
                Color statusColor;

                // Set color based on status
                switch (item['status']) {
                  case 'นำส่งสินค้าแล้ว':
                    statusColor = Colors.green;
                    break;
                  case 'กำลังจัดส่ง':
                    statusColor = const Color.fromARGB(255, 228, 211, 54);
                    break;
                  case 'รับสินค้าและกำลังเดินทาง':
                    statusColor = Colors.red;
                    break;
                  default:
                    statusColor = Colors.black; // Default color
                }

                return GestureDetector(
                  onTap: () {
                    if (item['status'] == 'นำส่งสินค้าแล้ว') {
                      // Show details popup for delivered items
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(item['name']),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(item['imageUrl']),
                                SizedBox(height: 10),
                                Text(item['description']),
                                SizedBox(height: 10),
                                Text('Quantity: x${item['quantity']}'),
                                Text(
                                  'Status: ${item['status']}',
                                  style: TextStyle(color: statusColor),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Navigate to another page for other statuses
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserchatPage(), // Change this to your desired page
                        ),
                      );
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image
                          Image.network(
                            item['imageUrl'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          // Textual content
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1, // Limit to 1 line
                                      overflow: TextOverflow
                                          .ellipsis, // Add ellipsis if overflow
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          'x${item['quantity']} item',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                    Text(
                                      'Status: ${item['status']}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            statusColor, // Set the status color
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                // Display success icon if delivered
                                if (item['status'] == 'นำส่งสินค้าแล้ว')
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                else
                                  Icon(
                                    Icons.share_location,
                                    color: Colors
                                        .green, // Change color to indicate it's inactive
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
