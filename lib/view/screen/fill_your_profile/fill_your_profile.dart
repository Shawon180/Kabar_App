import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kabar/view/screen/logIn_screen/login_screen.dart';

import '../../../utill/const colors/const_color.dart';
class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  TextEditingController userNameController=TextEditingController();
  TextEditingController fullNameController=TextEditingController();
  TextEditingController emailAddressController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  File ?_selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fill your Profile",
          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [

                  CircleAvatar(
                    backgroundColor: kButtonColor,
                    radius: 70,
                    backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                  ),
                  InkWell(
                    onTap: (){
                      _picImageFromGallery();

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,right: 10),
                      child: Image.asset("assets/icon/camera.png",width: 30,height: 30,fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 48,
                child: TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  decoration: kInputDecoration.copyWith(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text("Username"),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 48,
                child: TextFormField(
                  controller: fullNameController,
                  keyboardType: TextInputType.name,
                  decoration: kInputDecoration.copyWith(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text("Full Name"),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 48,
                child: TextFormField(
                  controller:emailAddressController,
                  keyboardType: TextInputType.name,
                  decoration: kInputDecoration.copyWith(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text("Email Address"),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 48,
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: kInputDecoration.copyWith(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: const Text("Phone Number"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: kContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogInScreen()),
                  );

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next",
                      style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
  Future _picImageFromGallery() async{
    final returnedImage= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage==null)return;
    setState(() {
      _selectedImage=File(returnedImage.path);
    });

  }
}
