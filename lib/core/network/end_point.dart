abstract class EndPoints {
  static const String baseUrl =
      'https://nti-ecommerce-api-production-fcb1.up.railway.app/api/';
  static const String register = 'register';
  static const String login = 'login';
  static const String getUserData = 'get_user_data';
  static const String refreshToken = 'refresh_token';
  static const String updateUserProfile = 'update_profile';
  static const String getUser = 'delete_user';
  static const String changePassword = 'change_password';
  static const String getAllSliders = 'get_all_sliders';
  static const String addNewSlider = 'new_slider';
  static const String deleteSlider = 'delete_slider';

  static const String getAllCategories = 'get_all_categories';
  static const String addNewCategory = 'new_category';
  static const String deleteCategory = 'delete_category';

  static const String getAllProducts = 'products';
  static const String addNewProduct = 'new_product';
  static const String deleteProduct = 'delete_product';

  static const String getAllOrders = 'orders';
  static const String updateOrderStatus = 'update_order_status';
  static const String deleteOrder = 'delete_order';

  static const String searchProducts = 'search';
}
