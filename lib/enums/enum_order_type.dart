enum OrderType { express, fast }

extension EnumRole on OrderType {
  String toJsonString() {
    switch (this) {
      case OrderType.express:
        return 'EXPRESS';
      case OrderType.fast:
        return "FAST";
    }
  }

  OrderType getType(String type) {
    switch (type) {
      case 'EXPRESS':
        return OrderType.express;
      case 'FAST':
        return OrderType.fast;
      default:
        return OrderType.fast;
    }
  }

  String display() {
    switch (this) {
      case OrderType.express:
        return "Hoả tốc";
      case OrderType.fast:
        return "Giao hàng nhanh";
    }
  }
}

OrderType stringToOrderType(String type) {
  switch (type) {
    case 'EXPRESS':
      return OrderType.express;
    case 'FAST':
      return OrderType.fast;
    default:
      return OrderType.fast;
  }
}

String orderTypeToString(OrderType type) {
  switch (type) {
    case OrderType.express:
      return 'EXPRESS';
    case OrderType.fast:
      return 'FAST';
  }
}
