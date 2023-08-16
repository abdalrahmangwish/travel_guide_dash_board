import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/assets.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/core/utils/utils.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/add_guide_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_guide/presentation/blocs/add_guide_cubit/add_guide_cubit.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/presentation/widgets/add_place_widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddGuide extends StatefulWidget {
  const AddGuide({Key? key}) : super(key: key);

  @override
  State<AddGuide> createState() => _AddGuideState();
}

class _AddGuideState extends State<AddGuide> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController yearsOfExperienceController =
      TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  String imagePath = '';

  List<String> genders = ["male", "female"];

  String? selectedGender;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      child: BlocProvider(
        create: (context) => AddGuideCubit(),
        child: Builder(builder: (context) {
          return BlocListener<AddGuideCubit, AddGuideState>(
            listener: (context, state) {
              if (state is AddGuideLoading) {
                context.loaderOverlay.show();
              } else if (state is AddGuideError) {
                context.loaderOverlay.hide();
                Utils.showCustomToast("error while adding");
              } else if (state is AddGuideLoaded) {
                nameController.clear();
                bioController.clear();
                emailController.clear();
                passwordController.clear();
                ageController.clear();
                yearsOfExperienceController.clear();
                locationController.clear();
                context.read<AddGuideCubit>().clearImage();
                Utils.showCustomToast("add new Guide Completed");
                context.loaderOverlay.hide();
              }
            },
            child: Scaffold(
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(gradient: Constant.primaryBodyColor),
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
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
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
                                controllerName: emailController,
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
                                controllerName: passwordController,
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
                              child: DropDownTextField(
                                selectedOption: selectedGender,
                                hintText: "gender",
                                options: genders,
                                onChanged: (value) {
                                  selectedGender = value;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAddTextField(
                                type: TextInputType.number,
                                color: Colors.black,
                                controllerName: ageController,
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
                                type: TextInputType.number,
                                color: Colors.black,
                                controllerName: yearsOfExperienceController,
                                label: "experience (in years)",
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
                                controllerName: locationController,
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
                              child: CustomDescriptionTextField(
                                type: TextInputType.text,
                                color: Colors.black,
                                controllerName: bioController,
                                label: "bio",
                                valedate: (String val) {
                                  if (val.isEmpty) {
                                    return "bio must be not Empty";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                onTap: () {
                                  context.read<AddGuideCubit>().addImage();
                                },
                                child:
                                    BlocBuilder<AddGuideCubit, AddGuideState>(
                                  buildWhen: (previous, current) {
                                    if (current is UpdateImageLoaded) {
                                      return true;
                                    }
                                    return false;
                                  },
                                  builder: (context, state) {
                                    return CircleAvatar(
                                      radius: 50,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image(
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fill,
                                          image: context
                                                      .read<AddGuideCubit>()
                                                      .image ==
                                                  null
                                              ? const AssetImage(
                                                  Assets.userAvatarAsset)
                                              : MemoryImage(context
                                                  .read<AddGuideCubit>()
                                                  .image!) as ImageProvider,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    gradient: Constant.primaryBodyColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextButton(
                                    child: Text(
                                      "add",
                                      style: StylesText.newDefaultTextStyle
                                          .copyWith(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        if (context
                                                    .read<AddGuideCubit>()
                                                    .image !=
                                                null &&
                                            selectedGender != null) {
                                          context
                                              .read<AddGuideCubit>()
                                              .addGuide(
                                                AddGuideParamsModel(
                                                  fileName: context
                                                          .read<AddGuideCubit>()
                                                          .imageName ??
                                                      "",
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  name: nameController.text,
                                                  gender: selectedGender!,
                                                  age: int.tryParse(
                                                          ageController.text) ??
                                                      -1,
                                                  yearsOfExperience: int.tryParse(
                                                          yearsOfExperienceController
                                                              .text) ??
                                                      -1,
                                                  location:
                                                      locationController.text,
                                                  bio: bioController.text,
                                                  image: context
                                                      .read<AddGuideCubit>()
                                                      .image!,
                                                ),
                                              );
                                        }
                                        if (context
                                                .read<AddGuideCubit>()
                                                .image ==
                                            null) {
                                          Utils.showCustomToast(
                                              "add guide image");
                                        }
                                        if (selectedGender == null) {
                                          Utils.showCustomToast(
                                              "select gender");
                                        }
                                      }
                                    },
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
