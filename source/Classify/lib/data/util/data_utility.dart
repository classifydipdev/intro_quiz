class DataUtility {
  static String formatFirestoreName(String displayName) {
    if (displayName == null) return null;
    var index = displayName.indexOf(" ");
    if (index == -1) return displayName;
    return displayName.substring(0, displayName.indexOf(" "));
  }
}
