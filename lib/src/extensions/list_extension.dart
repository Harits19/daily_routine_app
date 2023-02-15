extension ListExtension on List? {
  bool get isNullEmpty {
    return (this ?? []).isEmpty;
  }
}
