class IdUtil {
  IdUtil._();
  static String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
}
