import 'package:flutter/material.dart';
import 'package:last/pages/cart.dart';
import 'package:last/pages/menu.dart';
import 'package:last/pages/order.dart';
import 'package:last/pages/profile.dart';
import 'package:last/pages/rider/orderstatus.dart';
import 'package:last/pages/rider/riderOrder.dart';
import 'package:last/pages/rider/riderprofile.dart';

class NavPage extends StatefulWidget {
  final String userType; // รับค่า userType

  NavPage({required this.userType}); // กำหนดค่า userType ผ่าน constructor

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [];
  List<BottomNavigationBarItem> _navItems = [];

  @override
  void initState() {
    super.initState();
    // เช็ค userType เพื่อแสดงหน้าและไอคอนต่างกัน
    if (widget.userType == 'customer') {
      _pages = [
        MenuPage(),  // หน้าที่ 1
        OrderPage(), // หน้าที่ 2
        CartPage(),  // หน้าที่ 3
        ProfilePage(), // หน้าที่ 4
      ];

      _navItems = const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '', // ลบ label
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: '', // ลบ label
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '', // ลบ label
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '', // ลบ label
        ),
      ];
    } else if (widget.userType == 'rider') {
      _pages = [
        RiderorderPage(),  // หน้าที่ 1
        OrderstatusPage(), // หน้าที่ 2
        RiderprofilePage(), // หน้าที่ 3
      ];

      _navItems = const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '', // ลบ label
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: '', // ลบ label
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '', // ลบ label
        ),
      ];
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // อัปเดต index ของหน้าที่เลือก
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // แสดงหน้าเลือกตาม userType
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 75, 161, 72), // เปลี่ยนสีพื้นหลังเป็นสีเขียว
          items: _navItems, // แสดงไอคอนตาม userType
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white, // สีไอคอนและตัวหนังสือเมื่อเลือก
          unselectedItemColor: Colors.black, // สีไอคอนและตัวหนังสือเมื่อไม่เลือก
          onTap: _onItemTapped, // ฟังก์ชันที่ถูกเรียกเมื่อกดไอคอน
          type: BottomNavigationBarType.fixed, // ชนิดของ BottomNavigationBar
          selectedFontSize: 0, // ลบขนาดฟอนต์ของข้อความที่เลือก
          unselectedFontSize: 0, // ลบขนาดฟอนต์ของข้อความที่ไม่เลือก
        ),
      ),
    );
  }
}
