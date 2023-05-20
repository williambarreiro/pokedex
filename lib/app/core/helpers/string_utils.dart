class StringUtils {
  StringUtils._();

  static String capitalizeFirstLetter(String text) =>
      text.substring(0, 1).toUpperCase() + text.substring(1);

  static String formatId(int id) => '#${id.toString().padLeft(3, '0')}';
}
