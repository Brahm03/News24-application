import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prac1/core/components/SizConfig.dart';
import 'package:prac1/core/constants/colorConst.dart';
import 'package:prac1/core/constants/fontsize.dart';
import 'package:prac1/core/constants/fontweight.dart';
import 'package:prac1/core/constants/iconConst.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: const [
                      BackButton(),
                      Text(
                        'Profile',
                        style: TextStyle(
                            color: ColorsConst.black,
                            fontWeight: FontweightConst.bold),
                      ),
                      Spacer(),
                      Text(
                        'Save',
                        style: TextStyle(
                            color: ColorsConst.grey,
                            fontWeight: FontweightConst.bold,
                            fontSize: FontSize.medium),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: CircleAvatar(
                              radius: 54,
                              backgroundColor: ColorsConst.grey,
                              child: image != null
                                  ? Image.file(image!, fit: BoxFit.cover,) : Image.network(
                                      'https://www.kindpng.com/picc/m/171-1712282_profile-icon-png-profile-icon-vector-png-transparent.png')
                          ),
                        ),
                      ),
                      const Text('name')
                    ],
                  )),
              Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(
                                fontWeight: FontweightConst.bold,
                                fontSize: FontSize.medium),
                          ),
                          SizedBox(
                            width: getWidth(20),
                          ),
                          const Text(
                            'email',
                            style: TextStyle(fontWeight: FontweightConst.w6),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(50),
                      ),
                      const Text(
                        'Link account',
                        style: TextStyle(
                            fontWeight: FontweightConst.bold,
                            fontSize: FontSize.medium),
                      ),
                      SizedBox(
                        height: getHeight(30),
                      ),
                      Row(
                        children: [
                          IconConst.facebooksmall,
                          SizedBox(
                            width: getWidth(10),
                          ),
                          const Text(
                            'Facebook',
                            style: TextStyle(fontSize: FontSize.medium),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.right_chevron)
                        ],
                      ),
                      SizedBox(
                        height: getHeight(30),
                      ),
                      Row(
                        children: [
                          IconConst.twittersmall,
                          SizedBox(
                            width: getWidth(10),
                          ),
                          const Text(
                            'Twitter',
                            style: TextStyle(fontSize: FontSize.medium),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.right_chevron)
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imagetemprory = File(image.path);
      setState(() => this.image = imagetemprory);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
