import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: const Offset(0, -50),
        child: Container(
          width: 500,
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    "asset/image/jovalogo.png",
                  ),
                ),
                const SizedBox(height: 20,),
                const Flexible(
                  flex: 1,
                  child: Text(
                    "안녕하세요, 구인구직 서비스 JOVA입니다!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
