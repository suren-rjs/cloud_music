import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
          key: key,
          toolbarHeight: 70.0,
          title: const Text("Cloud Music"),
          backgroundColor: const Color(0xff2a2a2a),
          actions: [
            InkWell(
              onTap: () {
                // Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        );
}
