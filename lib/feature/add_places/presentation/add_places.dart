import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/core/styles/style.dart';

class AddPlaces extends StatelessWidget {
   AddPlaces({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController regionId = TextEditingController();
  List<String>Images=[];
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
                        child:SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  width:  MediaQuery.of(context).size.width,
                                  constraints: BoxConstraints(
                                    minHeight:  MediaQuery.of(context).size.height * 0.3,
                                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text('this places to Add map')),
                                ),
                              ),
                              TextButton(
                                onPressed: () {  },
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.07,
                                  constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width*0.1
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.image_search_rounded,size: 30, color: Colors.black12,),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.0009,),
                                      Text("Add Image ",style: StylesText.newDefaultTextStyle.copyWith(
                                        color: Colors.grey
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomAddTextField(
                                  type: TextInputType.text,
                                  color: Colors.black,
                                  controllerName: nameController,
                                  label: "name",
                                  valedate: (String val) {
                                    if (val.isEmpty) {
                                      return "name must be not Empty";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomAddTextField(
                                  type: TextInputType.text,
                                  color: Colors.black,
                                  controllerName: typeController,
                                  label: "type",
                                  valedate: (String val) {
                                    if (val.isEmpty) {
                                      return "type must be not Empty";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomAddTextField(
                                  type: TextInputType.text,
                                  color: Colors.black,
                                  controllerName: descriptionController,
                                  label: "description",
                                  valedate: (String val) {
                                    if (val.isEmpty) {
                                      return "description must be not Empty";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomAddTextField(
                                  type: TextInputType.text,
                                  color: Colors.black,
                                  controllerName: priceController,
                                  label: "price",
                                  valedate: (String val) {
                                    if (val.isEmpty) {
                                      return "price must be not Empty";
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
                    ),

                  )),
            ],
          ),
        ),
      );  }
}
