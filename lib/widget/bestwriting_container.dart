import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestwritingContainer extends StatelessWidget {
  final String title;
  final String body;
  final String post_title;

  const BestwritingContainer({
    super.key,
    required this.title,
    required this.body,
    required this.post_title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset('asset/image/joavlogo.png'),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  post_title,
                                  style: const TextStyle(
                                    fontSize: 24
                                  ),
                                ),
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  body,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}
