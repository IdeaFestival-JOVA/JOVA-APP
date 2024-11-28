import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/screens/search_screen.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
                child: Image.asset(
                    "asset/image/jovalogo.png",
                  width: 70,
                ),
            ),
            const Flexible(
              flex: 1,
                child: SizedBox()
            ),
            Flexible(
              flex: 3,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => const SearchScreen()),
                    );
                  },
                  child: Container(
                    color: const Color(0x00C3C3C3),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                            child: Text(
                              "구인 구직 찾아보기",
                              style: TextStyle(
                                color: Color(0xFFADADAD),
                                fontWeight: FontWeight.w100,
                                fontSize: 12
                              ),
                            ),
                        ),
                        Flexible(
                          flex: 1,
                            child: Icon(
                              Icons.search,
                            )
                        ),
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
    );
  }
}
