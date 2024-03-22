import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  TextEditingController newsTileController=TextEditingController();
  TextEditingController newSubTileController=TextEditingController();
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create News",
          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: kSubTitleColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
        SizedBox(
          child: _selectedImage != null
              ? Container(
            width: MediaQuery.of(context).size.width, // Set container width to full screen width
            height: MediaQuery.of(context).size.height / 4, // Set container height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: FileImage(_selectedImage!),
                fit: BoxFit.cover, // Adjust as per your requirement
              ),
            ),
            child: GestureDetector(
              onTap: () {
                _picImageFromGallery();
              },
              child: Container(
                alignment: FractionalOffset.bottomRight,
                width: 20,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,right: 10),
                  child: Image.asset("assets/icon/edit_icon.png",width: 30,height: 30,fit: BoxFit.cover,),
                ),
              ),
            ),
          )
              : DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width, // Set container width to full screen width
                height: MediaQuery.of(context).size.height / 4, // Set container height
                child: GestureDetector(
                  onTap: () {
                    _picImageFromGallery();
                  },
                  child: Container(
                    color: Colors.transparent, // Change the overlay color for interaction if needed
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add, color: kSubTitleColor),
                          Text(
                            'Add Cover Photo',
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
const SizedBox(height: 10,),
    TextFormField(
      style: kTextStyle.copyWith(fontSize: 24,),
                decoration: const InputDecoration(
              hintStyle: TextStyle(color: kTextFieldBorderColor,fontSize:24,fontWeight: FontWeight.w400 ),
              prefixIconColor: kTextFieldBorderColor,
              hintText: "News title",




            ),),
const SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(color: kTextFieldBorderColor,fontWeight: FontWeight.w400 ),
                prefixIconColor: kTextFieldBorderColor,
                hintText: "Add News/Article",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Change color and width here// Adjust border radius as needed
                ),



              ),),


          ],
        ),
      ),
    );
  }

  Future _picImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}
