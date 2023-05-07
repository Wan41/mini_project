import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var pokeApi =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List? pokedex;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: -40,
            right: -50,
            child: Image.asset(
              'assets/images/pokeball1.png',
              width: 300,
              color: Colors.grey[350],
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 40,
              ),
            ),
          ),
          const Positioned(
            top: 80,
            left: 25,
            child: Text(
              'Pokedot',
              style: TextStyle(
                fontFamily: 'pokemonfont',
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                            ),
                            itemCount: pokedex!.length,
                            itemBuilder: (context, index) {
                              var type = pokedex![index]['type'][0];
                              return InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: type == 'Grass'
                                            ? const Color.fromARGB(
                                                255, 83, 239, 164)
                                            : type == 'Fire'
                                                ? Colors.redAccent
                                                : type == 'Water'
                                                    ? Colors.blue
                                                    : type == 'Bug'
                                                        ? Colors.purpleAccent
                                                        : type == 'Poison'
                                                            ? Colors.blueGrey
                                                            : type == 'Electric'
                                                                ? Colors
                                                                    .amberAccent
                                                                : type ==
                                                                        'Ground'
                                                                    ? Colors
                                                                        .brown
                                                                    : type ==
                                                                            'Ghost'
                                                                        ? Colors
                                                                            .black87
                                                                        : Colors
                                                                            .tealAccent,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: -10,
                                          right: -10,
                                          child: Image.asset(
                                            'assets/images/pokeball.png',
                                            color: Colors.blueGrey[100],
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 5,
                                          child: Text(
                                            pokedex![index]['name'],
                                            style: const TextStyle(
                                              fontFamily: 'pokemonfont',
                                              letterSpacing: 2,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 30,
                                          left: 10,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black26,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                type.toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: -5,
                                          bottom: 3,
                                          child: Hero(
                                            tag: index,
                                            child: CachedNetworkImage(
                                              imageUrl: pokedex![index]['img'],
                                              height: 100,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => DetailScreen(
                                                detail: pokedex![index],
                                                color: type == 'Grass'
                                                    ? const Color.fromARGB(
                                                        255, 83, 239, 164)
                                                    : type == 'Fire'
                                                        ? Colors.redAccent
                                                        : type == 'Water'
                                                            ? Colors.blue
                                                            : type == 'Bug'
                                                                ? Colors
                                                                    .purpleAccent
                                                                : type ==
                                                                        'Poison'
                                                                    ? Colors
                                                                        .blueGrey
                                                                    : type ==
                                                                            'Electric'
                                                                        ? Colors
                                                                            .amberAccent
                                                                        : type ==
                                                                                'Ground'
                                                                            ? Colors.brown
                                                                            : type == 'Ghost'
                                                                                ? Colors.black87
                                                                                : Colors.tealAccent,
                                                hero: index,
                                              )));
                                },
                              );
                            }))
                    : Container(
                        padding: const EdgeInsets.only(top: 200),
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/pika_loader.gif'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];
        setState(() {});
      }
    });
  }
}
