// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:next_life/components.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:next_life/data/init_data.dart';
import 'package:next_life/constants.dart';
import 'dart:async';
import 'package:next_life/transfer.dart';

class AvatarDialogPage extends StatefulWidget {
  const AvatarDialogPage({Key? key}) : super(key: key);

  @override
  State<AvatarDialogPage> createState() => _AvatarDialogPageState();
}

class _AvatarDialogPageState extends State<AvatarDialogPage> {

  final imagePicker = ImagePicker();

  // Function to get an image from the gallery
  Future<void> getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        sendData.curAvatarImage = pickedFile.path;
        final result = await uploadUserImage();
        if(result)
        {
          sendUserInfoToAWS();
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/");
        }
      } catch (error) {
        Fluttertoast.showToast(
          msg: 'Error updating file. $error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }
  }

  // Function to capture an image from the camera
  Future<void> getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      try {
        sendData.curAvatarImage = pickedFile.path;
        final result = await uploadUserImage();
        if(result)
        {
          sendUserInfoToAWS();
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/");
        }

      } catch (error) {
        Fluttertoast.showToast(
          msg: 'Error updating file. $error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //Image Picker function to get image from gallery

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0.0),
      content: buildContent(),
    );
  }

  Widget buildContent() {
    return Consumer(builder: (context, ref, child){
      final themeMode = sendData.theme;
      Color backgroundColor = themeMode==0? lightTheme.scaffoldBackgroundColor:darkTheme.scaffoldBackgroundColor;
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.rectangle,
          border: Border.all(color: const Color(0xFFBDDED8)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: double.maxFinite,
        height: 350,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: sendData.curAvatarImage == ""? const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 45,
                      backgroundImage: AssetImage('assets/meta/avatar.jpg')
                  ):
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                    backgroundImage: FileImage(File(sendData.curAvatarImage)),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.zero,
                  child: MlIconButton(
                    size: 25,
                    tooltip: 'Close',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    icon: Icons.close,
                    enabledColor: const Color(0xFF237A6A),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            getImageFromGallery();
                          },
                          child: Container(
                            height: 42,
                            width: 128,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF237A6A),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: const Color(0xFF7EBEB2),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              'Upload picture',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.07,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            getImageFromCamera();
                          },
                          child: Container(
                            height: 42,
                            width: 128,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF237A6A),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: const Color(0xFF7EBEB2),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              'Take photo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 130.0,
                    child: GridView.count(
                      crossAxisCount: 4,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: null,
                          ),
                          child: Image.asset('assets/meta/photo1.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: null,
                          ),
                          child: Image.asset('assets/meta/photo1.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: null,
                          ),
                          child: Image.asset('assets/meta/photo1.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: null,
                          ),
                          child: Image.asset('assets/meta/photo1.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: null,
                          ),
                          child: Image.asset('assets/meta/photo1.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: null,
                          ),
                          child: Image.asset('assets/meta/photo1.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
