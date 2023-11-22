class TruncateTextWithEllipsis {
  static String truncateWithEllipsis(String text, int cutoff) {
    if(text.isNotEmpty){
    if (text.length <= cutoff) {
        return text;
      } else {
        return '${text.substring(0, cutoff)}...';
      }
    }
    return "-";
  }
}
