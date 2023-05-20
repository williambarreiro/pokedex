class StringUtils {
  StringUtils._();

  static String capitalizeFirstLetter(String text) =>
      text.substring(0, 1).toUpperCase() + text.substring(1);

  static String padThreeLeft(int id) => id.toString().padLeft(3, '0');
  static String formatId(int id) => '#${padThreeLeft(id)}';
}
