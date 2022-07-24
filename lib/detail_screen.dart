import "package:flutter/material.dart";
import 'package:flutterbasic/tourism_place.dart';

var informationText = const TextStyle(fontFamily: 'Oxygen');
var titleText = const TextStyle(fontFamily: 'Staatliches');

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;
  const DetailMobilePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                place.name,
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
                        place.openDays,
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
                        place.openTime,
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
                        place.ticketPrice,
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
                  place.description),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final TourismPlace place;
  const DetailWebPage({super.key, required this.place});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
          child: Center(
            child: Container(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wisata Bandung",
                    style: titleText.copyWith(fontSize: 32),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(widget.place.imageAsset),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Scrollbar(
                              thumbVisibility: true,
                              controller: _scrollController,
                              child: Container(
                                height: 150,
                                child: ListView(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  children: widget.place.imageUrls.map((url) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(url)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Expanded(
                          child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                widget.place.name,
                                style: titleText.copyWith(fontSize: 32),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.place.openDays,
                                    style: informationText,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.access_time),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.place.openTime,
                                    style: informationText,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.monetization_on_outlined),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.place.ticketPrice,
                                    style: informationText,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                widget.place.description,
                                textAlign: TextAlign.justify,
                                style: informationText.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
