import 'package:flutter/material.dart';
import 'package:last/pages/bill.dart'; // นำเข้าหน้าบิล

class OrderstatusPage extends StatefulWidget {
  @override
  _OrderstatusPageState createState() => _OrderstatusPageState();
}

class _OrderstatusPageState extends State<OrderstatusPage> {
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
                            mainAxisAlignment:
                                MainAxisAlignment.start, // เริ่มที่ด้านบน
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1, // จำกัดให้แสดง 1 บรรทัด
                                overflow: TextOverflow
                                    .ellipsis, // แสดง ellipsis ถ้าเกิน
                              ),
                              SizedBox(height: 4), // ระยะห่างระหว่างข้อความ
                              Text(
                                'ส่งออเดอร์สำเร็จ',
                                style: TextStyle(
                                    fontSize:
                                        14, // ขนาดตัวอักษรที่เล็กลงถ้าต้องการ
                                    color: Colors.green,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors
                                        .green // สามารถเปลี่ยนสีได้ตามต้องการ
                                    ),
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
                              icon: Icon(
                                Icons.checklist_rtl, // ไอคอนติ๊ก
                                color: Colors.green, // สีของไอคอน
                                size: 24, // ขนาดของไอคอน
                              ),
                              onPressed: () {},
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
}
