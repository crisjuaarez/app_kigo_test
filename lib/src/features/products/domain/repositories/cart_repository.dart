abstract class CartRepository {
  Future<void> addProduct(String id);
  Future<void> removeProduct(String id);
  Future<double> getTotalPrice();
}
