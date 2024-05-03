import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_request/pages/item_page.dart';
import '../models/item.dart';
import '../widgets/bottom_navigasi.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  int itemsCount = 0;
  List<Item> items = [
    Item(name: "Gula Pasir", price: 18500, image: "Gula.png"),
    Item(name: "Garam Dapur", price: 5000, image: "Garam.png"),
    Item(name: "Sambal Terasi", price: 2000, image: "Terasi.png"),
  ];

  @override
  Widget build(BuildContext context) {
    itemsCount = items.length;
    return Scaffold(
      body: SafeArea(
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
          const SizedBox(
            height: 40,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: itemsCount,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(items[index].name);
                        print(items[index].price);
                        print(items[index].image);
                        String name = items[index].name;
                        int price = items[index].price;
                        String image = items[index].image;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ItemPage(
                                      name,
                                      price,
                                      image,
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                'lib/resources/${items[index].image}',
                                width: MediaQuery.of(context).size.width * .30,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    items[index].name,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    "Rp${items[index].price.toString()}",
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14)),
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )),
        ],
      )),
      bottomNavigationBar: BottomNav(selectedItem: 0),
    );
  }
}
