enum ShipmentUpdate { pickedUp, faildPickup, successDelivery, failDelivery }

extension EnumRole on ShipmentUpdate {
  String toJsonString() {
    switch (this) {
      case ShipmentUpdate.pickedUp:
        return 'PICKED_UP';
      case ShipmentUpdate.faildPickup:
        return 'FAIL_PICKUP';
      case ShipmentUpdate.successDelivery:
        return 'SUCCESS_DELIVERY';
      case ShipmentUpdate.failDelivery:
        return 'FAIL_DELIVERY';
    }
  }

  ShipmentUpdate getType(String type) {
    switch (type) {
      case 'PICKED_UP':
        return ShipmentUpdate.pickedUp;
      case 'FAIL_PICKUP':
        return ShipmentUpdate.faildPickup;
      case 'SUCCESS_DELIVERY':
        return ShipmentUpdate.successDelivery;
      case 'FAIL_DELIVERY':
        return ShipmentUpdate.failDelivery;
      default:
        return ShipmentUpdate.pickedUp;
    }
  }

  String display() {
    switch (this) {
      case ShipmentUpdate.pickedUp:
        return 'Đã lấy hàng';
      case ShipmentUpdate.faildPickup:
        return 'Lấy hàng thất bại';
      case ShipmentUpdate.successDelivery:
        return 'Giao thành công';
      case ShipmentUpdate.failDelivery:
        return 'Giao thất bại';
    }
  }
}

ShipmentUpdate stringToShipmentUpdate(String type) {
  switch (type) {
    case 'PICKED_UP':
      return ShipmentUpdate.pickedUp;
    case 'FAIL_PICKUP':
      return ShipmentUpdate.faildPickup;
    case 'SUCCESS_DELIVERY':
      return ShipmentUpdate.successDelivery;
    case 'FAIL_DELIVERY':
      return ShipmentUpdate.failDelivery;
    default:
      return ShipmentUpdate.pickedUp;
  }
}

String shipmentUpdateToString(ShipmentUpdate type) {
  switch (type) {
    case ShipmentUpdate.pickedUp:
      return 'PICKED_UP';
    case ShipmentUpdate.faildPickup:
      return 'FAIL_PICKUP';
    case ShipmentUpdate.successDelivery:
      return 'SUCCESS_DELIVERY';
    case ShipmentUpdate.failDelivery:
      return 'FAIL_DELIVERY';
  }
}
