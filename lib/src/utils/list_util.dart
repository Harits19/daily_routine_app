extension ListUtil on List? {
  bool get isNullEmpty {
    return (this ?? []).isEmpty;
  }
}
