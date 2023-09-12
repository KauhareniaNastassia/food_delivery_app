class AppConstants {
  ///contact links
  static String facebookLink = 'https://www.facebook.com';
  static String instagramLink = 'https://www.instagram.com';
  static String phoneNumber = '+375291234567';
  static String geoPosition = 'geo:53.915629,27.569431';

  ///orders
  static String allFoods = 'All Foods';
  static String noCategory = '-';

  ///admin panel
  static List<String> userRoles = [
    'customer',
    'admin',
    'super admin',
  ];
  static String allUsers = 'all users';
  static List<String> orderStatus = [
    'new orders',
    'completed orders',
  ];

  ///validation
  static int passwordLength = 6;
  static int menuItemTitleLength = 25;
  static int numbersAfterDot = 2;
  static int descriptionLength = 500;
  static int ingredientLength = 20;
  static int categoryLength = 15;
}
