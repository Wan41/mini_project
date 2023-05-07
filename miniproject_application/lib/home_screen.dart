import 'package:flutter/material.dart';

import 'list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    late double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: sizeHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.overlay,
              ),
              image: AssetImage('assets/images/pxfuel.jpg'),
            )),
          ),
          Positioned(
            bottom: -10,
            left: 60,
            child: InkWell(
              onTap: () {
                bottomSheet();
              },
              child: SizedBox(
                // height: 200,
                // width: 100,
                child: Image.asset(
                  'assets/images/ball2.gif',
                  height: 130,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future bottomSheet() {
    return showModalBottomSheet(
        // useSafeArea: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Hello! I\'m Pikachu',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Let\'s to know my friends',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset('assets/images/pokemon.gif'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1, 4),
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                      )
                    ]),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListScreen(),
                      ),
                    );
                  },
                  child: const Center(
                    child: Text(
                      'Le\'t Go',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
