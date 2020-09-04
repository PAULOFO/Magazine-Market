import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return BottomSheet(
          onClosing: () {},
          builder: (_) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.camera_alt),
                   FlatButton(
                     child: const Text('Tirar foto'),
                     onPressed: () {},
                   ),
                 ],
               ),
               Divider(color: Colors.black),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.image),
                   FlatButton(
                     child: const Text('Escolher da galeria...'),
                     onPressed: () {},
                   ),
                 ],
               ),
               Divider(color: Colors.black),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text(
                     'X',
                     style: TextStyle(
                         color: Colors.redAccent,
                         fontSize:18,
                     ),
                   ),
                   FlatButton(
                     child: const Text(
                         'Cancelar',
                       style: TextStyle(
                         color: Colors.redAccent,
                         //fontSize: 20,
                       ),
                     ),
                     onPressed: () {
                       Navigator.of(context).pop();
                     },
                   ),
                 ],
               ),
              Divider(color: Colors.black),
            ],
          ),
      );
    else
      return CupertinoActionSheet(
        title: const Text('Selecionar Foto para o anúncio'),
        message: const Text('Escolha a origem da Foto'),
        cancelButton:  CupertinoActionSheetAction(
          child: const Text(
              'Cancelar',
            style: TextStyle(color: Colors.redAccent),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Câmera'),
            onPressed: () {},
          ),
          CupertinoActionSheetAction(
            child: const Text('Galeria'),
            onPressed: () {},
          ),
        ],
      );
  }
}
