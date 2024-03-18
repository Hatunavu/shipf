enum WeightUnitType { kg, ton, box, cube, package }

extension EnumWeightUnit on WeightUnitType {
  String toJsonString() {
    switch (this) {
      case WeightUnitType.kg:
        return 'KG';
      case WeightUnitType.ton:
        return "TON";
      case WeightUnitType.box:
        return 'BOX';
      case WeightUnitType.cube:
        return 'CUBE';
      case WeightUnitType.package:
        return "PACKAGE";
    }
  }

  WeightUnitType getType(String type) {
    switch (type) {
      case 'KG':
        return WeightUnitType.kg;
      case 'TON':
        return WeightUnitType.ton;
      case 'BOX':
        return WeightUnitType.box;
      case 'CUBE':
        return WeightUnitType.cube;
      case 'PACKAGE':
        return WeightUnitType.package;
      default:
        return WeightUnitType.kg;
    }
  }

  String display() {
    switch (this) {
      case WeightUnitType.kg:
        return "Kg";
      case WeightUnitType.ton:
        return "Tấn";
      case WeightUnitType.box:
        return "Thùng";
      case WeightUnitType.cube:
        return 'Khối';
      case WeightUnitType.package:
        return "Kiện";
    }
  }
}

WeightUnitType stringToWeightUnitType(String type) {
  switch (type) {
    case 'KG':
      return WeightUnitType.kg;
    case 'TON':
      return WeightUnitType.ton;
    case 'BOX':
      return WeightUnitType.box;
    case 'CUBE':
      return WeightUnitType.cube;
    case 'PACKAGE':
      return WeightUnitType.package;
    default:
      return WeightUnitType.kg;
  }
}

String weightUnitTypeToString(WeightUnitType type) {
  switch (type) {
    case WeightUnitType.kg:
      return 'KG';
    case WeightUnitType.ton:
      return 'TON';
    case WeightUnitType.box:
      return 'BOX';
    case WeightUnitType.cube:
      return 'CUBE';
    case WeightUnitType.package:
      return "PACKAGE";
  }
}
