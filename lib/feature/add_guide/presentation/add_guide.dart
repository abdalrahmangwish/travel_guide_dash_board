import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/core/styles/style.dart';
class AddGuide extends StatelessWidget {
   AddGuide({Key? key}) : super(key: key);
 final TextEditingController nameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
 final TextEditingController genderController = TextEditingController();
 final TextEditingController ageController = TextEditingController();
 final TextEditingController yearsOfExperienceController = TextEditingController();
 final TextEditingController locationController = TextEditingController();
 final TextEditingController bioController = TextEditingController();
  String imagePath ='';
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
                flex: 6,
                child: Container(
                  height: double.infinity,
                  decoration:
                  BoxDecoration(gradient: Constant.primaryBodyColor),
                  child: Padding(
                    padding: EdgeInsets.all(Constant.defaultPadding),
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5), // Shadow color
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: double.infinity,
                        child:Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: nameController,
                                label: "Name Guide",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "Name Guide must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: nameController,
                                label: "email",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "email must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: nameController,
                                label: "password",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "password must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: nameController,
                                label: "gender",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "gender must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: nameController,
                                label: "age",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "age must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: nameController,
                                label: "years Of Experience",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "years Of Experience must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: nameController,
                                label: "location",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "location must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: nameController,
                                label: "bio",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "bio must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height*0.07,
                                  decoration: BoxDecoration(
                                    gradient: Constant.primaryBodyColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextButton(
                                    child:Text("accepted",style: Styles.defaultTextStyle.copyWith(
                                      color: Constant.secondaryColor
                                    ),) ,
                                    onPressed: (){},
                                  ),
                                )
                            ),

                          ],
                        ),



                    ),
                  ),

                )),
          ],
        ),
      ),
    );
  }
}
