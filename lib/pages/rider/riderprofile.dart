import 'package:flutter/material.dart';

class RiderprofilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create TextEditingController for the TextField inputs
    final TextEditingController nameController = TextEditingController(text: 'John Doe');
    final TextEditingController phoneController = TextEditingController(text: '1234567890');
    final TextEditingController addressController = TextEditingController(text: '123 Main St');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            CircleAvatar(
              radius: 50, // Adjust the size of the profile picture
              backgroundImage: NetworkImage('https://example.com/profile.jpg'), // Add your image URL here
            ),
            SizedBox(height: 60),

            // Name TextField
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 75, 161, 72),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 75, 161, 72),
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 75, 161, 72),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Phone TextField
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 75, 161, 72),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 75, 161, 72),
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 75, 161, 72),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Address TextField
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 75, 161, 72),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 75, 161, 72),
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 75, 161, 72),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Profile Image
            Image.network(
              'https://img.wongnai.com/p/1920x0/2021/01/17/c95146b336274b0283b92b6943d289d8.jpg',
              width: 300,
              height: 130,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 80),

            // Save Button
            ElevatedButton(
              onPressed: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ยืนยันการบันทึก'),
        content: Text('คุณต้องการบันทึกข้อมูลหรือไม่?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิด dialog
            },
            child: Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              // ในที่นี้คุณสามารถเพิ่มลอจิกสำหรับบันทึกข้อมูลได้
              // เช่น ส่งข้อมูลไปยัง API หรือฐานข้อมูล

              // ปิด dialog
              Navigator.of(context).pop();
              // แสดงข้อความยืนยันการบันทึก
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('ข้อมูลถูกบันทึกเรียบร้อยแล้ว!'),
                ),
              );
            },
            child: Text('ยืนยัน'),
          ),
        ],
      );
    },
  );
},

              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green, // สีพื้นหลังปุ่ม
              ),
            ),
          ],
        ),
      ),
    );
  }
}
