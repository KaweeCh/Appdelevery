import 'package:flutter/material.dart';

class ReceiveOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Map and time information
          Container(
            height: 250, // Height for the map section
            child: Stack(
              children: [
                // Placeholder for the map image
                Image.network(
                  'https://via.placeholder.com/400x250.png?text=Map', 
                  width: double.infinity,
                  height: 1000,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('1 hr 22 min\n46 mi\n1.6 gl', 
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('1 hr 14 min\n38 mi\n1.3 gl', 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Sender and Receiver Info
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(radius: 30, child: Icon(Icons.person)),
                    SizedBox(height: 8),
                    Text('Sender'),
                  ],
                ),
                Icon(Icons.arrow_forward),
                Column(
                  children: [
                    CircleAvatar(radius: 30, child: Icon(Icons.person)),
                    SizedBox(height: 8),
                    Text('Receiver'),
                  ],
                ),
              ],
            ),
          ),

          // Status and Action Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('สถานะ: ไรเดอร์กำลังไปรับสินค้า', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Cancel action
                      },
                      child: Text('ยกเลิกออร์เดอร์'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Show the dialog when changing status
                        _showChangeStatusDialog(context);
                      },
                      child: Text('เปลี่ยนสถานะ'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showChangeStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('เปลี่ยนสถานะ'),
          content: Text('คุณต้องการเปลี่ยนสถานะหรือไม่?'),
          actions: <Widget>[
            TextButton(
              child: Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('ยืนยัน'),
              onPressed: () {
                // เพิ่มฟังก์ชันในการเปลี่ยนสถานะที่นี่
                Navigator.of(context).pop(); // Close the dialog
                // สามารถทำการเปลี่ยนสถานะได้ที่นี่
              },
            ),
          ],
        );
      },
    );
  }
}
