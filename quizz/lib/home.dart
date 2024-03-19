import 'package:flutter/material.dart';
import 'package:quizz/profile.dart';
import 'package:quizz/square.dart';

class HomePage extends StatelessWidget {
  final List _namaMahasiswa = [
    "Irma Wang",
    "Angela Nolan",
    "Mara Lucero",
    "Kirby Larsen",
    "King Rich",
    "Pearlie Esparza",
    "Elva Zamora",
    "Kirk Walton",
    "Jackson Mann",
    "Bryon Schroeder",
    "Gwen Blanchard",
    "Jasmine Lucas",
    "Jermaine Medina",
    "Marc Snyder",
    "Leila Hatfield",
    "Millie Barnes",
    "Thelma Carlson",
    "Annette Norris",
    "Werner Mayo",
    "Gertrude Morgan",
    "Trisha Terry",
    "Maria Proctor",
    "Shelton Garner",
    "Kelli Bowman",
    "Evangelina Ramos",
    "Diego Hayes",
    "Jake Townsend",
    "Wilma Haas",
    "Gordon Fletcher",
    "Tony Dixon",
    "Aron Stewart",
    "Marquita Patrick",
    "Benito Burgess",
    "Rick Pruitt",
    "Bertha Bush",
    "Kenny Alvarez",
    "Melody Young",
    "Chang Melendez",
    "Nathanial Cummings",
    "Ginger Buck",
    "Lucille Klein",
    "Anibal Barry",
    "Gloria Vazquez",
    "Tyree Clark",
    "Dana Oneal",
    "Jerold Juarez",
    "Irvin Goodwin",
    "Kerry Jacobs",
    "Ladonna Li",
    "Carmella Rasmussen",
    "Reginald Wilkerson",
    "Celeste Stafford",
    "Michel Ritter",
    "Johnathan Morgan",
    "Donnell Terry",
    "Boyd Kerr",
    "Doris Delacruz",
    "Janelle Jones",
    "Rubin Gallegos",
    "Rebecca House",
    "Booker Campbell",
    "Norman Mcconnell",
    "Damon Dawson",
    "May Mckinney",
    "Chester Walsh",
    "Reyes Mullins",
    "Yesenia Mccall",
    "Rob Larsen",
    "Ann Clark",
    "Floyd Fleming",
    "Ahmed Greer",
    "Lea Clarke",
    "Ashlee Brooks",
    "Renee Benson",
    "Lynn Roth",
    "Sal Perkins",
    "Sarah Flowers",
    "Theo Welch",
    "Mollie Holt",
    "Esther Kirby",
    "Chance Hammond",
    "Reyna Chang",
    "Janette Mccoy",
    "Danny Mccullough",
    "Arnoldo Nguyen",
    "Lisa Jensen",
    "Harrison Haas",
    "Josie Bush",
    "Darin Golden",
    "Sue Pennington",
    "Carrie Ward",
    "Marquita Pollard",
    "Clay Henry",
    "Cyrus Buck",
    "Rey Underwood",
    "Duane Skinner",
    "Marissa Doyle",
    "Andy Mccormick",
    "Mariano Duke",
    "Brenton Spears"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hi"),
          backgroundColor: Colors.grey[200],
        ),
        body: Column(
          children: [
            Container(
              child: _button(),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _namaMahasiswa.length,
                    itemBuilder: (context, index) {
                      return MySquare(
                        child: _namaMahasiswa[index],
                      );
                    })),
          ],
        ));
  }

  Widget _button() {
    return Container(
        child: TextButton(
            onPressed: () {
              new Profilepage();
            },
            child: const Text(
              "Profile",
              style: TextStyle(color: Colors.blueGrey),
            )));
  }
}
