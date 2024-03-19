import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  String message = "";

  bool isLoginSuccess = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _header(),
            _inputField(),
            _buttonLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return const Column(
      children: [
        Text(
          "E-LEARNING UPNYK",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _inputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              username = value;
            });

            print("username =" + username);
          },
          decoration: InputDecoration(
              // errorText: message ? "username salah" : null,
              hintText: "Username",
              // enabledBorder: OutlineInputBorder(
              //     borderSide:
              //         BorderSide(color: isError ? Colors.red : Colors.blue),
              //     borderRadius: BorderRadius.circular(18)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Colors.blueAccent.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.blueAccent.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          obscureText: true,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          print("$isLoginSuccess");

          String text = "";

          if (username == "flutter" && password == "flutter123") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          } else {
            text = "Login gagal";
          }

          SnackBar snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
