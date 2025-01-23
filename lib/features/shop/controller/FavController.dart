//
//
// import 'dart:convert';
//
// import 'package:ecom/utils/local_storage/storage_utility.dart';
// import 'package:ecom/utils/popups/loaders.dart';
// import 'package:get/get.dart';
//
// class FavController extends GetxController{
//   static FavController get instance => Get.find();
//   final Favorites = <String,bool>{}.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     initFav();
//   }
//
//   Future<void> initFav() async{
//     final json = TLocalStorage.instance().readData("Favorites");
//     if(json!=null){
//     final storeFav = json.de(json) as Map<String,dynamic>;
//     Favorites.assignAll(storeFav.map((key, value) => MapEntry(key, value as bool )));
//     }
//   }
//
//   bool isFav(String pid){
//     return Favorites[pid] ?? false;
//   }
//
//   void toggleFavoriteProduct(String pid) {
//
//     if(!Favorites.containsKey(pid)) {
//       Favorites[pid] = true;
//       saveFavoritesToStorage();
//
//       TLoaders.custonToast(message: "Product has been added from the Bishlist");
//     }
//     else{
//     TLocalStorage.instance().removeData(pid);
//     Favorites.remove(pid);
//     saveFavoritesToStorage();
//     Favorites.refresh();
//     TLoaders.custonToast(message: "Product has been removed from the Bishlist");
//     }
//   }
//
//   void saveFavoritesToStorage() {
//     final encodedFavorites = json.encoder(Favorites);
//     TLocalStorage.instance().saveData("favorites", encodedFavorites);
//   }
//     Future List<ProductModel>> favoriteProducts() async (
//
//     return avait ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
//
//
//
//
//   }