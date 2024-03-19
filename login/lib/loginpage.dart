import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  String message = "";
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
            _forgotPassword(),
            _signup(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return const Column(
      children: [
        Text(
          "Login",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Hello, welcome back"),
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
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: isError ? Colors.red : Colors.blue),
                  borderRadius: BorderRadius.circular(18)),
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
          obscureText: true,
        ),
        const SizedBox(height: 10),
        // ElevatedButton(
        //   onPressed: () {},
        //   style: ElevatedButton.styleFrom(
        //     shape: const StadiumBorder(),
        //     padding: const EdgeInsets.symmetric(vertical: 16),
        //     backgroundColor: Colors.blue,
        //   ),
        //   child: const Text(
        //     "Login",
        //     style: TextStyle(fontSize: 20, color: Colors.white),
        //   ),
        // )
      ],
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          print("username: " + username);
          print("password: " + password);

          String text = "Login Succes";

          if (username == "flutter" && password == "flutter123") {
            setState(() {
              // isValid = true;
            });
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

  Widget _forgotPassword() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.blueGrey),
      ),
    );
  }

  Widget _signup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? "),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.blueGrey),
            ))
      ],
    );
  }
}
