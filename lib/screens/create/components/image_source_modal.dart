import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {

  ImageSourceModal(this.onImageSelected);

  final Function(File) onImageSelected;

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
                children: [
                  Container(

                  ),
                ],
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.camera_alt),
                   FlatButton(
                     child: const Text('Tirar foto'),
                     onPressed: getFromCamera,
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
                     onPressed: getFromGallery,
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
                     onPressed: Navigator.of(context).pop,
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
           onPressed: Navigator.of(context).pop,
        ),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Câmera'),
            onPressed: getFromCamera,
          ),
          CupertinoActionSheetAction(
            child: const Text('Galeria'),
            onPressed: getFromGallery,
          ),
        ],
      );
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if(pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if(pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),//1 é formato quadrado
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Editar Imagem',
        toolbarColor: Colors.redAccent,
        toolbarWidgetColor: Colors.white
      ),
      iosUiSettings: IOSUiSettings(
        title: 'Editar Imagem',
        cancelButtonTitle: 'Cancelar',
        doneButtonTitle: 'Concluir',),
    );
    if(croppedFile != null)
      onImageSelected(croppedFile);
  }
}
