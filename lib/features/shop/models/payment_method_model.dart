class PaymentMethodModel {
  String name;
  String image;
  String isAvailable;

  PaymentMethodModel({required this.image, required this.name, required this.isAvailable
  });

  static PaymentMethodModel empty() => PaymentMethodModel(image: '', name: '', isAvailable: '');
}
