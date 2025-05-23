import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_style.dart';
import 'package:shop/core/widgets/custom_buttom.dart';
import 'package:shop/core/widgets/custom_circleAvatar.dart';
import 'package:shop/core/widgets/custom_text_filed.dart';

class MyProfile_view extends StatelessWidget {
  const MyProfile_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        centerTitle: true,
        title: Text('Profile', style: AppTextStyle.appbarstylr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              CustomCircleAvatar(),
              SizedBox(height: 35),
              CustomTextFormFiled(
                controller: TextEditingController(),
                validator: null,
                hintText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
              CustomTextFormFiled(
                controller: TextEditingController(),
                validator: null,
                hintText: 'phone',
                prefixIcon: Icon(Icons.phone),
              ),
              SizedBox(height: 35),
              CustomBottom(text: 'Save', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
