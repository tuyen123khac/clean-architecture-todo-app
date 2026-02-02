/// DTO for POST /sell-transactions request body.
class SellTransactionDto {
  final String id;
  final String productId;
  final int quantity;
  final int price;
  final DateTime soldAt;

  const SellTransactionDto({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.soldAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'quantity': quantity,
        'price': price,
        'soldAt': soldAt.toIso8601String(),
      };
}
