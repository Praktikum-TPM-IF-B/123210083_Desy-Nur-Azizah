import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz/model/DummyMahasiswa.dart';
import 'package:quizz/page/profile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.user}) : super(key: key);

  List<Mahasiswa> mhsData = generateMahasiswaData();
  Mahasiswa user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hi ${user.nama}"),
          backgroundColor: Colors.grey[200],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    
                    _button(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profilepage(
                            user: user,
                          ),
                        ),
                      );
                    }),
                    _title(),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: mhsData.length,
                  itemBuilder: (context, index) {
                    Mahasiswa mahasiswa = mhsData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Profilepage(user: mahasiswa),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text('${mahasiswa.nama}'),
                        subtitle: Text('${mahasiswa.nim}'),
                        trailing: Text('${mahasiswa.tahunMasuk}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget _button(VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed,
          child: const Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Data Teman',
        ),
      ],
    );
  }
}
