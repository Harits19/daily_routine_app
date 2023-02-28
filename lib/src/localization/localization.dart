enum MyLanguage {
  id,
  en;
}

enum Localization {
  version(en: "Version", id: "Versi"),
  hello(en: "Hello", id: "Hallo");

  const Localization({
    required String en,
    required String id,
  })  : _en = en,
        _id = id;
  final String _id;
  final String _en;

  String text(MyLanguage myLocal) {
    switch (myLocal) {
      case MyLanguage.en:
        return _en;
      case MyLanguage.id:
        return _id;
    }
  }
}

typedef T = Localization;
