enum LoadingType { pickup, delivery, all }

extension EnumRole on LoadingType {
  String toJsonString() {
    switch (this) {
      case LoadingType.pickup:
        return 'PICKUP';
      case LoadingType.delivery:
        return "DELIVERY";
      case LoadingType.all:
        return "ALL";
    }
  }

  LoadingType getType(String type) {
    switch (type) {
      case 'PICKUP':
        return LoadingType.pickup;
      case 'DELIVERY':
        return LoadingType.delivery;
      case 'ALL':
        return LoadingType.all;
      default:
        return LoadingType.pickup;
    }
  }

  String display() {
    switch (this) {
      case LoadingType.pickup:
        return "Đầu lấy";
      case LoadingType.delivery:
        return "Đầu giao";
      case LoadingType.all:
        return "Cả hai";
    }
  }
}

LoadingType stringToLoadingType(String type) {
  switch (type) {
    case 'PICKUP':
      return LoadingType.pickup;
    case 'DELIVERY':
      return LoadingType.delivery;
    case 'ALL':
      return LoadingType.all;
    default:
      return LoadingType.pickup;
  }
}

String loadingTypeToString(LoadingType type) {
  switch (type) {
    case LoadingType.pickup:
      return 'PICKUP';
    case LoadingType.delivery:
      return 'DELIVERY';
    case LoadingType.all:
      return 'ALL';
  }
}
