import 'package:flutter/material.dart';
import 'package:last/pages/bill.dart'; // นำเข้าหน้าบิล

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  
  // Sample data for the menu items
  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'กระเพราหมูกรอบ',
      'rating': 4.8,
      'description': 'กระเพราะหมูกรอบแสนอร่อย',
      'imageUrl':
          'https://img.wongnai.com/p/1920x0/2021/01/17/c95146b336274b0283b92b6943d289d8.jpg',
      'quantity': 1,
    },
    {
      'name': 'กระเพราหมูสับไข่ดาว',
      'rating': 4.8,
      'description': 'กระเพราหมูสับไข่ดาวแสนอร่อย',
      'imageUrl': 'https://images.deliveryhero.io/image/fd-th/LH/ci6d-hero.jpg',
      'quantity': 1,
    },
    {
      'name': 'กระเพราหมูกรอบเทพเจ้าดาวเหนือ',
      'rating': 4.8,
      'description': 'กระเพราหมูกรอบเทพ',
      'imageUrl':
          'https://www.ryoiireview.com/upload/article/202003/1584433400_3cabc1dc52dc70069b84deed66aafa0a.jpg',
      'quantity': 1,
    },
    // Add more items here...
  ];

  String searchQuery = ''; // Holds the search query

  @override
  Widget build(BuildContext context) {
    // Filter the menu items based on the search query
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
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1, // Limit to 1 line
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if overflow
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text('${item['rating']}'),
                                  SizedBox(width: 10),
                                  // Limit the description to 1 line and add ellipsis
                                  Expanded(
                                    child: Text(
                                      item['description'],
                                      maxLines: 1, // Limit to 1 line
                                      overflow: TextOverflow
                                          .ellipsis, // Add ellipsis if overflow
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Shopping cart and quantity controls
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () {
                                _showConfirmationDialog(
                                    context, item); // Show confirmation dialog
                              },
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  iconSize: 15,
                                  onPressed: () {
                                    // Add functionality for decreasing quantity
                                  },
                                ),
                                Text('${item['quantity']}'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  iconSize: 15,
                                  onPressed: () {
                                    // Add functionality for increasing quantity
                                  },
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
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'ยืนยันการสั่งซื้อสินค้า',
            style: TextStyle(fontWeight: FontWeight.bold), // ตัวหนา
          ),
          content: Text(
            'คุณต้องการเพิ่ม ${item['name']} ลงในตะกร้าหรือไม่?',
            // ตัวหนา
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100, // กำหนดความกว้างของปุ่ม
                  decoration: BoxDecoration(
                    color: Colors.green, // สีพื้นหลัง
                    borderRadius:
                        BorderRadius.circular(10), // กำหนด border radius
                  ),
                  child: TextButton(
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: Colors.white, // สีข้อความ
                        fontWeight: FontWeight.bold, // ตัวหนา
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // ทำให้สีพื้นหลังเป็นโปร่งใส
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // ปิด dialog
                    },
                  ),
                ),
                SizedBox(width: 30), // เพิ่ม gap ระหว่างปุ่ม
                Container(
                  width: 100, // กำหนดความกว้างของปุ่ม
                  decoration: BoxDecoration(
                    color: Colors.green, // สีพื้นหลัง
                    borderRadius:
                        BorderRadius.circular(10), // กำหนด border radius
                  ),
                  child: TextButton(
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                        color: Colors.white, // สีข้อความ
                        fontWeight: FontWeight.bold, // ตัวหนา
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // ทำให้สีพื้นหลังเป็นโปร่งใส
                    ),
                    onPressed: () {
                      // เพิ่มฟังก์ชันในการเพิ่มรายการลงในตะกร้าที่นี่
                      Navigator.of(context).pop(); // ปิด dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BillPage()), // ไปที่หน้า Bill
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
