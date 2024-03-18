enum TonnageType {
  one,
  onePointFour,
  onePointNine,
  twoPointFive,
  threePointFive,
  five,
  seven
}

extension EnumTonnage on TonnageType {
  String toJsonString() {
    switch (this) {
      case TonnageType.one:
        return '1.0';
      case TonnageType.onePointFour:
        return "1.4";
      case TonnageType.onePointNine:
        return '1.9';
      case TonnageType.twoPointFive:
        return '2.5';
      case TonnageType.threePointFive:
        return '3.5';
      case TonnageType.five:
        return '5.0';
      case TonnageType.seven:
        return '7.0';
    }
  }

  TonnageType getType(String type) {
    switch (type) {
      case '1.0':
        return TonnageType.one;
      case '1.4':
        return TonnageType.onePointFour;
      case '1.9':
        return TonnageType.onePointNine;
      case '2.5':
        return TonnageType.twoPointFive;
      case '3.5':
        return TonnageType.threePointFive;
      case '5.0':
        return TonnageType.five;
      case '7.0':
        return TonnageType.seven;
      default:
        return TonnageType.one;
    }
  }

  String display() {
    switch (this) {
      case TonnageType.one:
        return "1 tấn";
      case TonnageType.onePointFour:
        return "1.4 tấn";
      case TonnageType.onePointNine:
        return "1.9 tấn";
      case TonnageType.twoPointFive:
        return '2.5 tấn';
      case TonnageType.threePointFive:
        return '3.5 tấn';
      case TonnageType.five:
        return '5 tấn';
      case TonnageType.seven:
        return '7 tấn';
    }
  }
}

TonnageType stringToTonnageType(String type) {
  switch (type) {
    case '1.0':
      return TonnageType.one;
    case '1.4':
      return TonnageType.onePointFour;
    case '1.9':
      return TonnageType.onePointNine;
    case '2.5':
      return TonnageType.twoPointFive;
    case '3.5':
      return TonnageType.threePointFive;
    case '5.0':
      return TonnageType.five;
    case '7.0':
      return TonnageType.seven;
    default:
      return TonnageType.one;
  }
}

String tonnageTypeToString(TonnageType type) {
  switch (type) {
    case TonnageType.one:
      return '1.0';
    case TonnageType.onePointFour:
      return '1.4';
    case TonnageType.onePointNine:
      return '1.9';
    case TonnageType.twoPointFive:
      return '2.5';
    case TonnageType.threePointFive:
      return '3.5';
    case TonnageType.five:
      return '5.0';
    case TonnageType.seven:
      return '7.0';
  }
}
