import 'package:flutter/material.dart';
import 'package:last/pages/login.dart';
import 'package:last/Layout/customerLayout.dart';
import 'package:last/Layout/riderlayout.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpForm(),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? _selectedValue; // ตัวแปรสำหรับเก็บค่าที่เลือกใน Dropdown
  final List<String> _options = [
    'rider',
    'user',
  ]; // รายการตัวเลือก

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 75, 161, 72),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(20),
                child: const Icon(
                  Icons.person,
                  size: 100.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              // Phone Number Field
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
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
              const SizedBox(height: 20),
              // Password Field
              const TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
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
              const SizedBox(height: 20),
              // Name Field
              const TextField(
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
              const SizedBox(height: 20),
              // Address Field
              const TextField(
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
              const SizedBox(height: 20),
              // Dropdown
              Row(
                children: [
                  Container(
                    width: 180,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Type',
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      ),
                      value: _selectedValue,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
          
                        // แสดงป๊อปอัพตามประเภทที่เลือก
                       
                      },
                      items:
                          _options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              if (_selectedValue == 'user') ...[
                // Layout สำหรับ customer
                CustomerLayout(),
              ] else if (_selectedValue == 'rider') ...[
                // Layout สำหรับ rider
                RiderLayout(),
              ],
              const SizedBox(height: 50),
              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  print('Sign up button pressed');
                },
                child: const Text('Sign up'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: const Color.fromARGB(255, 75, 161, 72),
                  minimumSize: const Size(260, 80),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have account yet?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
