import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  final detail;
  final Color color;
  final int hero;
  const DetailScreen(
      {super.key, this.detail, required this.color, required this.hero});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        children: [
          Positioned(
              top: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
              )),
          Positioned(
            top: 80,
            left: 10,
            child: Text(
              widget.detail['name'],
              style: const TextStyle(
                fontFamily: 'pokemonfont',
                fontSize: 25,
                letterSpacing: 1,
              ),
            ),
          ),
          Positioned(
            top: 115,
            left: 25,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
              child: Text(
                widget.detail['type'].join(', '),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: -40,
            child: Image.asset(
              'assets/images/pokeball2.png',
              width: 200,
              scale: 15,
            ),
          ),
          Positioned(
            bottom: -10,
            child: Container(
              height: heigth * 0.6,
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  detailInfo(''),
                ],
              ),
            ),
          ),
          Positioned(
              left: (width / 2) - 100,
              top: heigth * 0.18,
              child: Hero(
                tag: widget.hero,
                child: CachedNetworkImage(
                  imageUrl: widget.detail['img'],
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
              )),
        ],
      ),
    );
  }

  Widget detailInfo(contex) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.3,
                child: const Text(
                  'Name',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: width * 0.3,
                child: Text(
                  widget.detail['name'],
                  style: GoogleFonts.righteous(fontSize: 17),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.3,
                child: const Text(
                  'Height',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: width * 0.3,
                child: Text(
                  widget.detail['height'],
                  style: GoogleFonts.righteous(fontSize: 17),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.3,
                child: const Text(
                  'Weight',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: width * 0.3,
                child: Text(
                  widget.detail['weight'],
                  style: GoogleFonts.righteous(fontSize: 17),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.3,
                child: const Text(
                  'Spawn time',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: width * 0.3,
                child: Text(
                  widget.detail['spawn_time'],
                  style: GoogleFonts.righteous(fontSize: 17),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.3,
                child: const Text(
                  'Weaknesses',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                width: width * 0.5,
                child: Text(
                  widget.detail['weaknesses'].join(', '),
                  style: GoogleFonts.righteous(fontSize: 16),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       width: width * 0.3,
          //       child: const Text(
          //         'Evolution',
          //         style: TextStyle(fontSize: 15),
          //       ),
          //     ),
          //     SizedBox(
          //       width: width * 0.5,
          //       child: ListView.builder(
          //         itemCount: detail.length,
          //         itemBuilder: (context, index) {
          //           return Padding(
          //             padding: const EdgeInsets.only(right: 0.0),
          //             child: Text(
          //               widget.detail['next_evolution'][index]['name'],
          //               style: GoogleFonts.righteous(fontSize: 16),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
