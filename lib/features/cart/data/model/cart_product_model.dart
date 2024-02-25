class CartProductModel {
  int? productId;
  int? quantity;

  CartProductModel({
    this.productId,
    this.quantity,
  });

  CartProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }

  CartProductModel.copyWith({
    int? productId,
    int? quantity,
  }) {
    CartProductModel(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}
