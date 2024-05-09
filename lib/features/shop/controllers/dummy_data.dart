import 'package:hausify_v2/features/shop/models/banner_model.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants/image_strings.dart';
import '../../personalization/models/user_model.dart';
import '../models/category_model.dart';

class HDummyData{

  /// -- Banners
  static final List <BannerModel> banners = [
    BannerModel(imageUrl: HImages.banner1, targetScreen: HRoutes.order, active: false),
    BannerModel(imageUrl: HImages.banner2, targetScreen: HRoutes.cart, active: true),
    BannerModel(imageUrl: HImages.banner3, targetScreen: HRoutes.favourites, active: true),
    BannerModel(imageUrl: HImages.banner4, targetScreen: HRoutes.search, active: true),
    BannerModel(imageUrl: HImages.banner5, targetScreen: HRoutes.settings, active: true),
    BannerModel(imageUrl: HImages.banner6, targetScreen: HRoutes.userAddress, active: true),
    BannerModel(imageUrl: HImages.banner8, targetScreen: HRoutes.checkout, active: false),
  ];

  /// -- User
  // static final UserModel user = UserModel (
  //   firstName: 'Naman',
  //   lastName: 'Gupta',
  //   email: 'naman@gmail.com',
  //   phoneNumber: '+911234567890',
  //   profilePicture: HImages.user,
  //   addresses: [
  //     AddressModel(
  //       id: '1',
  //       name: 'Naman',
  //       phoneNumber: '+911234567890',
  //       street:'asdfghuytrew',
  //       city: 'asdfghiuyutrtr',
  //       state: 'asdfghkiuyt',
  //       postalCode: 'asdfghjytre',
  //       country: 'asdfghnjhyt',
  //     ),
  //     AddressModel(
  //       id: '1',
  //       name: 'Naman',
  //       phoneNumber: '+911234567890',
  //       street:'asdfghuytrew',
  //       city: 'asdfghiuyutrtr',
  //       state: 'asdfghkiuyt',
  //       postalCode: 'asdfghjytre',
  //       country: 'asdfghnjhyt',
  //     ),
  //   ]
  // );

  /// -- Cart
  // static final CartModel cart = CartModel(
  //   cartId: '321',
  //   items: [
  //     CartItemModel(
  //       productId: '234',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //     CartItemModel(
  //       productId: '234',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //   ]
  // );

  /// -- Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'aedqwd',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 23,
  //     orderDate: DateTime(2024, 05, 01),
  //     deliveryDate: DateTime(2024, 05, 01),
  //   ),
  //   OrderModel(
  //     id: 'aedqwd',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 23,
  //     orderDate: DateTime(2024, 05, 01),
  //     deliveryDate: DateTime(2024, 05, 01),
  //   ),
  // ];

  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: HImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: HImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: HImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: HImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: HImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: HImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: HImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelery', image: HImages.jeweleryIcon, isFeatured: true),

    /// -- Subcategories
    CategoryModel(id: '8', name: 'Sports Shoes', image: HImages.jeweleryIcon, isFeatured: true,parentId: '1'),
    CategoryModel(id: '9', name: 'Track Suits', image: HImages.jeweleryIcon, isFeatured: true,parentId: '1'),
    CategoryModel(id: '10', name: 'Sports Equipment', image: HImages.jeweleryIcon, isFeatured: true,parentId: '1'),



  ];



}
