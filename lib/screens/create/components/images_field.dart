import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magazine_market/screens/create/components/image_source_modal.dart';


class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onImageSelected(File iamge){
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                if (Platform.isAndroid) {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => ImageSourceModal(onImageSelected),
                  );
                } else {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (_) => ImageSourceModal(onImageSelected),
                  );
                }
              },
              child: CircleAvatar(
                radius: 44,
                backgroundColor: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.white,
                    ),
                    // Text(
                    //   '+',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 30,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
