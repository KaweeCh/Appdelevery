import 'package:flutter/material.dart';
import 'package:last/pages/bill.dart';
import 'package:last/pages/rider/receiveOrder.dart'; // นำเข้าหน้าบิล

class RiderorderPage extends StatefulWidget {
  @override
  _RiderorderPageState createState() => _RiderorderPageState();
}

class _RiderorderPageState extends State<RiderorderPage> {
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
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8.0), // กำหนดขอบมน
                          child: Image.network(
                            item['imageUrl'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        // Textual content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Icon(
                                    Icons.access_time,
                                    size: 36.0, // ขนาดของไอคอน
                                    color: const Color.fromARGB(
                                        255, 209, 167, 0), // สีของไอคอน
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        _showConfirmationDialog(context, item),
                                    child: Text(
                                      'กดรับงาน',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          color: Colors.green,
                                          decorationColor: Colors.green),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        _showJobDetailsDialog(context, item),
                                    child: Text(
                                      'ดูรายละเอียดงาน',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          color: Colors.green,
                                          decorationColor: Colors.green),
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'คุณยืนยันที่จะรับออเดอร์หรือไม่',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                // ตัวหนา
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReceiveOrderPage()), // ไปที่หน้า Bill
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

  void _showJobDetailsDialog(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green, // สีของขอบ
                width: 2.0, // ความหนาของขอบ
              ),
              borderRadius: BorderRadius.circular(5), // มุมมนของกรอบ
            ),
            padding: EdgeInsets.all(5), // เพิ่ม padding ภายในกรอบ
            child: Text(
              '${item['name']}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16, // ขนาดตัวอักษร
              ), // ตัวหนา
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // กำหนดขอบมน
                child: Image.network(
                  item['imageUrl'],
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                padding: EdgeInsets.all(10), // เพิ่ม padding ภายในกรอบ
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green, // สีของขอบ
                    width: 2.0, // ความหนาของขอบ
                  ),
                  borderRadius: BorderRadius.circular(5), // มุมมนของกรอบ
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('ผู้ส่ง: xxx'),
                    SizedBox(
                        height: 5), // ใช้ height เพื่อเพิ่มช่องว่างในแนวตั้ง
                    Text('เบอร์โทร: xxxx'),
                    SizedBox(
                        height: 5), // ใช้ height เพื่อเพิ่มช่องว่างในแนวตั้ง
                    Text('ที่อยู่: xxx'),
                    SizedBox(
                        height: 10), // ใช้ height เพื่อเพิ่มช่องว่างในแนวตั้ง
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // กำหนดขอบมน
                      child: Image.network(
                        item['imageUrl'],
                        width: 100,
                        height: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green, // สีพื้นหลังปุ่ม
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // padding ปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // ขอบมนปุ่ม
                      ),
                    ),
                    child: Text(
                      'ปิด',
                      style: TextStyle(
                        color: Colors.white, // สีตัวอักษร
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
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
