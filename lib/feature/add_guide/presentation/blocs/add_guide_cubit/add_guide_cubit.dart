import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/add_guide_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/domain/use_cases/add_guide_use_case.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_guide_state.dart';

class AddGuideCubit extends Cubit<AddGuideState> {
  AddGuideCubit() : super(AddGuideInitial());
  Uint8List? image;
  String? imageName;
  void addImage() async {
    emit(UpdateImageLoading());
    final ImagePicker picker = ImagePicker();

    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = await file.readAsBytes();
      imageName = file.name;
      emit(UpdateImageLoaded());
    } else {
      emit(UpdateImageError());
    }
  }

  void clearImage() async {
    emit(UpdateImageLoading());
    image = null;
    imageName = null;
    emit(UpdateImageLoaded());
  }

  void addGuide(AddGuideParamsModel params) async {
    emit(AddGuideLoading());
    final res = await AddGuideUseCase().call(params);
    res.fold((l) => emit(AddGuideError()), (r) => emit(AddGuideLoaded()));
  }
}
