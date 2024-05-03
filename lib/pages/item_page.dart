import 'package:flutter/material.dart';
import '../models/item.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemPage extends StatelessWidget {
  final String name;
  final int price;
  final String image;
  const ItemPage(this.name, this.price, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 42,
                    color: Colors.black,
                  ),
                  Text(
                    "Shopping",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800)),
                  ),
                  Icon(
                    Icons.person,
                    size: 42,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ClipRRect(
                child: Image.asset(
                  'lib/resources/${image}',
                  width: MediaQuery.of(context).size.width,
                  height: height / 1.5,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(name,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold))),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text('Rp$price',
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500))),
                    ))
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
