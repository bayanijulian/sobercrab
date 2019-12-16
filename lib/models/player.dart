enum DrinkType {
  water,
  beer,
  shot,
  mixed,
  wine
}

class Player {
  String name;
  DrinkType drinkType;
  int drinkCount;
  Player({this.name, this.drinkCount = 0, this.drinkType}) {
    this.name = _getProperName(this.name);
  }

  String _getProperName(String name) {
    String capital = name[0].toUpperCase();
    String lowercase = name.substring(1);
    String properName = capital + lowercase;
    return properName;
  }
}