import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jovajovajova/screens/search_screen.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
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
            Flexible(
              flex: 2,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => const SearchScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
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

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
