import 'package:ecom/features/authentication/user/user_model.dart';
import 'package:ecom/features/authentication/user/user_repository.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final fullName = userCredentials.user!.displayName ?? '';
        final nameParts = UserModel.nameParts(fullName);
        final username = UserModel.generateUsername(fullName);

        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await UserRepository.instance.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data Not Saved',
          message:
              'Something went wrong while saving your information.You can re-save your data in your Profile.');
    }
  }
}
