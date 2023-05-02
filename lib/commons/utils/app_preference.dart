import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppPreference {
  static const KEY_ACCESS_TOKEN = 'key_access_token';
  static const KEY_CUSTOMER_ID = 'key_customer_id';
  static const KEY_FIRST_NAME = 'key_first_name';
  static const KEY_LAST_NAME = 'key_last_name';
  static const KEY_PHONE = 'key_phone';
  static const KEY_CART_ID = 'key_cart_id';
  static const KEY_EMAIL = 'key_email';
  static const KEY_WISHLIST = 'key_wishlist';

  final storage = const FlutterSecureStorage();

  void setString(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> get(String key) async {
    return await storage.read(key: key);
  }

  Future<String?> getWishlistIds() async {
    return await storage.read(key: AppPreference.KEY_WISHLIST);
  }

  Future<void> saveProductInWishlist(String id) async {
    var ids = await storage.read(key: AppPreference.KEY_WISHLIST);

    List<String> list = ids!.split(",");

    list.add(id);

    var newIds = list.join(",");

    return await storage.write(key: AppPreference.KEY_WISHLIST, value: newIds);
  }

  Future<void> addRemoveFromWishlist(String id) async {
    var ids = await storage.read(key: AppPreference.KEY_WISHLIST);

    if (ids == null || ids.isEmpty) {
      List<String> list = [id];
      var newIds = list.join(",");
      return await storage.write(key: AppPreference.KEY_WISHLIST, value: newIds);
    }
    List<String> list = ids.split(",");

    if (list.contains(id)) {
      list.remove(id);
    }else{
      list.add(id);
    }
    var newIds = list.join(",");

    return await storage.write(key: AppPreference.KEY_WISHLIST, value: newIds);
  }

  Future<bool> checkIdProductInWishlist(String id) async{
    var ids = await storage.read(key: AppPreference.KEY_WISHLIST);
    if (ids == null || ids.isEmpty) {
      return false;
    }
    List<String> list = ids.split(",");

    for (var element in list) {
      if (element == id) {
        return true;
      }
    }
    return false;
  }

  clear() {
    storage.deleteAll();
  }
}
