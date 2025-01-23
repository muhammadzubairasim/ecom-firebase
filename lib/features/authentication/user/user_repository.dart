//import 'package: Flutter/services.dart';
import 'package:ecom/features/authentication/authentication_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import '../../../features/personalization/models/user_model.dart'; i
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import 'package:ecom/features/authentication/user/user_model.dart';

/// Repository class for user-related operations.

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore.

  Future<void> saveUserRecord(UserModel user) async {
    try {
      final firebaseCollection = db.collection("Users");
      await firebaseCollection.doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      print(e.toString());
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel> fetchUserRecord() async {
    try {
      final firebaseCollection = db.collection("Users");
      final document = await firebaseCollection.doc(AuthenticationRepository.instance.userState?.uid).get();

      if(document.exists){
        return UserModel.fromSnapshot(document);
      }
      else{
        return UserModel.empty();
      }



    } on FirebaseException catch (e) {
      print(e.toString());
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
