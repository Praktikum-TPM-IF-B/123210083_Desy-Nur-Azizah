import 'package:flutter/material.dart';
import 'package:quizz/model/DummyMahasiswa.dart';
import 'package:quizz/page/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";
  String _errorTextUsername = '';
  String _errorTextPassword = '';
  String _errorLogin = '';

  List<Mahasiswa> mahasiswaData = generateMahasiswaData();

  void clearErrorText() {
    setState(() {
      _errorTextUsername = '';
      _errorTextPassword = '';
      _errorLogin = '';
    });
  }

  bool isValidLogin() {
    bool isValid = false;

    for (Mahasiswa user in mahasiswaData) {
      if (user.username == _username && user.password == _password) {
        isValid = true;
      }
    }

    return isValid;
  }

  Mahasiswa getUserData(String username) {
    for (Mahasiswa user in mahasiswaData) {
      if (user.username == _username && user.password == _password) {
        return user;
      }
    }

    return Mahasiswa(
        nama: '',
        nim: '',
        username: '',
        password: '',
        ipk: 0.0,
        tahunMasuk: 0,
        semesterSaatIni: 0,
        totalSKS: 0);
  }

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
    return Center(
      child: Text(
        "E-LEARNING UPNYK",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _inputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              _username = value;
            });
          },
          decoration: InputDecoration(
              errorText: _errorTextUsername == '' ? null : _errorTextUsername,
              hintText: "Username",
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
            errorText: _errorTextPassword == '' ? null : _errorTextPassword,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.blueAccent.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.key),
          ),
          onChanged: (password) {
            setState(() {
              _password = password;
            });
          },
          obscureText: true,
        ),
        const SizedBox(height: 10),
        Text(
          _errorLogin,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          clearErrorText();

          if (_username == '') {
            setState(() {
              _errorTextUsername = 'Username wahib di isi';
            });
          } else if (_password == '') {
            setState(() {
              _errorTextPassword == 'Password wajib di isi';
            });
          } else {
            bool isValidLogin = this.isValidLogin();

            if (isValidLogin) {
              Mahasiswa user = getUserData(_username);
              print('Successfully Login');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage(user: user);
              }));
            } else {
              setState(() {
                _errorLogin = "Login Failed.";
              });
              print('Login Failed');
            }
          }
        },
        child: Text(
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
