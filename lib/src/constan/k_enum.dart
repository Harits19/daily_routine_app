enum Weekend {
  monday(),
  tuesday(),
  wednesday(),
  thursday(),
  friday(),
  saturday(),
  sunday();



}

extension WeekendExtension on Weekend {
  String get formattedName {
    return name[0].toUpperCase() + name.substring(1, name.length);
  }

}
