import 'dart:convert';
import 'package:get/get.dart';
import 'package:hausify_v2/utils/local_storage/storage_utility.dart';
import 'package:hausify_v2/utils/popups/loaders.dart';
import '../../../../data/repositories/products/product_repository.dart';
import '../../models/product_model.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  // Method to initialize favourites by reading from storage
  Future<void> initFavourites() async {
    final json = HLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
        storedFavourites.map((key, value) => MapEntry(key, value as bool)),
      );
    }
  }

  bool isFavourite (String productId){
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId){
    if(!favourites.containsKey(productId)){
      favourites[productId]=true;
      saveFavouritesToStorage();
      HLoaders.customToast(message:'Product has been added to the wishlist.');
    }
    else{
      HLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      HLoaders.customToast(message: 'Product has been removed from the wishlist');
    }
  }

  void saveFavouritesToStorage(){
    final encodedFavourites = json.encode(favourites);
    HLocalStorage.instance().writeData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());

}}
