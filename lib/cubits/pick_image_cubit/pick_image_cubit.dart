import 'dart:io';

import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takly/cubits/pick_image_cubit/pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageStates> {
  PickImageCubit()
      : super(
          PickImageInitState(),
        );

        static PickImageCubit get(context)=>BlocProvider.of(context);

  File? file;
  String? url;
  
  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      emit(
        PickImageLoadingState(),
      );
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
      );

      emit(
        PickImageSuccessState(),
      );

      file = File(image!.path);

      var imageName=basename(image!.path);

      final storageRef=FirebaseStorage.instance.ref('1.jpg');
      storageRef.putFile(file!);

      url=await storageRef.getDownloadURL();
    } catch (e) {
      emit(
        PickImageFailuerState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
