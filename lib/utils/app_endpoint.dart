class AppEndpoint {
  AppEndpoint._();

  static const String BASE_URL = "http://app.dean.vn:9090/";
  static const String BASE_URL_IMAGE = "http://app.dean.vn:9090/uploads/";

  static const int connectionTimeout = 1500;
  static const int receiveTimeout = 1500;
  static const String keyAuthorization = "Authorization";

  static const int SUCCESS = 200;
  static const int ERROR_TOKEN = 401;
  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

  static const String CHECK_ROOM_EXIST = 'room/check_room_exist';
  static const String LOGIN = 'users/login';
  static const String CREATE_LAUNDRY_CART = 'room/create_laundry_cart';
  static const String ADD_LAUNDRY_TO_CART = 'room/request_laundry';
  static const String UPLOAD_IMAGE = 'room/upload_base64';
  static const String LIST_FOOD = 'food/get_list_food';
  static const String CATEGORY = 'category/get_list_category';
  static const String LIST_LAUNDRY = 'laundry/get_list_laundry';
  static const String URL_TOUR = 'users/get_url_tourist';
  static const String INFOR = 'hotelinfoitem/get_list';
}