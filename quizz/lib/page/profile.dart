import 'package:flutter/material.dart';
import 'package:quizz/model/DummyMahasiswa.dart';

class Profilepage extends StatelessWidget {
  Profilepage({Key? key, required this.user}) : super(key: key);

  Mahasiswa user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama : ${user.nama}',
                  style: TextStyle(fontSize: 20),
                ),
                Text('Nim : ${user.nim}', style: TextStyle(fontSize: 20)),
                Text('IPK : ${user.ipk}', style: TextStyle(fontSize: 20)),
                Text('Tahun Masuk : ${user.tahunMasuk}',
                    style: TextStyle(fontSize: 20)),
                Text('Semester : ${user.semesterSaatIni}',
                    style: TextStyle(fontSize: 20)),
                Text('Total SKS : ${user.totalSKS}',
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
