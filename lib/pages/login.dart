import 'package:flutter/material.dart';
import 'package:last/pages/menu.dart';
import 'package:last/pages/nav.dart';
import 'package:last/pages/singup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final type = "customer"; // เปลี่ยนเป็น customer กับ rider นะ
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0), // เพิ่มระยะห่างรอบๆ
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // จัดให้เนื้อหาอยู่กลาง
            children: [
              // Phone number
              Image.asset(
                'assets/logo.png', // เส้นทางของรูปภาพในโฟลเดอร์ assets
                height: 200, // ปรับขนาดความสูงของรูปภาพ
                width: 200, // ปรับขนาดความกว้างของรูปภาพ
              ),
              const SizedBox(height: 50),
              const TextField(
                keyboardType: TextInputType.phone, // กำหนดประเภทของแป้นพิมพ์
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(
                        255, 75, 161, 72), // เปลี่ยนสี label text เป็นสีแดง
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black), // เปลี่ยนสีกรอบเป็นแดง
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 75, 161, 72),
                        width: 2), // สีกรอบเมื่อเลือก
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 75, 161, 72)), // สีกรอบเมื่อสามารถใช้งานได้
                  ), // กรอบของ TextField
                ),
              ),
              const SizedBox(height: 20), // เพิ่มระยะห่างระหว่างฟิลด์
              // Password
              const TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true, // ซ่อนข้อความสำหรับรหัสผ่าน
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 75, 161, 72),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black), // เปลี่ยนสีกรอบเป็นแดง
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 75, 161, 72),
                        width: 2), // สีกรอบเมื่อเลือก
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 75, 161, 72)), // สีกรอบเมื่อสามารถใช้งานได้
                  ), // // กรอบของ TextField
                ),
              ),
              const SizedBox(height: 80), // เพิ่มระยะห่างระหว่างฟิลด์

              // Login Button
              ElevatedButton(
                onPressed: () {
                  // ฟังก์ชันเมื่อกดปุ่มเข้าสู่ระบบ
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavPage(userType: '$type',)),
                      );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  backgroundColor: const Color.fromARGB(255, 75, 161, 72),
                  minimumSize: Size(260, 80), // ปรับขนาดปุ่มให้กว้างสุด
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 40, // ขนาดตัวหนังสือ
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // ปรับความโค้งของขอบปุ่ม
                  ),
                ),
              ),
              SizedBox(height: 60), // เพิ่มระยะห่างระหว่างปุ่มและข้อความ

              // Don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // นำทางไปยังหน้า SignUpPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // ปรับ padding เป็น 0
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline, // ขีดเส้นใต้
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
