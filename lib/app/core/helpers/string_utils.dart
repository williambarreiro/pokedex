class StringUtils {
  StringUtils._();

  static String capitalizeFirstLetter(String text) =>
      text.substring(0, 1).toUpperCase() + text.substring(1);
}
