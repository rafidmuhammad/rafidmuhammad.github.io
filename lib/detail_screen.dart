import "package:flutter/material.dart";

var informationText = const TextStyle(fontFamily: 'Oxygen');
var titleText = const TextStyle(fontFamily: 'Staatliches');

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("images/farm-house.jpg"),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                "Farm House Lembang",
                textAlign: TextAlign.center,
                style: titleText.copyWith(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Open Today",
                        style: informationText,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "09.00-20.00",
                        style: informationText,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on_outlined),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Rp 25.000",
                        style: informationText,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                  textAlign: TextAlign.center,
                  style: informationText.copyWith(fontSize: 16),
                  "Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghasilkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instragamable"),
            ),
            Container(
              height: 150,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
