import 'package:daily_routine_app/src/enums/my_language.dart';

enum Localization {
  version(en: "Version", id: "Versi"),
  januari(),
  hello(en: "Hello", id: "Hallo");

  const Localization({
    String? en,
    String? id,
  })  : _en = en,
        _id = id;
  final String? _id;
  final String? _en;

  String text(MyLanguage myLocal) {
    switch (myLocal) {
      case MyLanguage.en:
        return _en ?? name;
      case MyLanguage.id:
        return _id ?? name;
    }
  }
}

typedef T = Localization;
