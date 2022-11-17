import 'package:flutter/material.dart';

import 'immutables.dart';

class BottomPlayer extends StatefulWidget {
  BottomPlayer({Key? key, required this.isListPage}) : super(key: key);

  late bool isListPage;

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0x64000000),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.isListPage ? 10.0 : 5.0),
            topRight: Radius.circular(widget.isListPage ? 10.0 : 5.0),
          )),
      height: widget.isListPage ? 175 : 120,
      // color: const Color(0xff2a2a2a),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: widget.isListPage ? 0 : 15),
                  widget.isListPage
                      ? Row(
                          textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 45,
                              width: 45,
                              child: customWidgets.playerImageNow(),
                            ),
                            const SizedBox(width: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  currentPlayingSong.songName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.fade,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  softWrap: true,
                                  currentPlayingSong.artist,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w100,
                                    overflow: TextOverflow.fade,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(width: 100),
                          ],
                        )
                      : Container(),
                  SizedBox(height: widget.isListPage ? 20 : 0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Color(0x70767676),
                      color: Color(0x8bffffff),
                      semanticsLabel: 'Progress',
                      minHeight: 3.75,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Text(
                        "2:32",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Spacer(),
                      Text(
                        "5:29",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            customWidgets.actionButtons(),
          ],
        ),
      ),
    );
  }
}
