enum ShipmentStatus {
  neww,
  pendingPickup,
  pickingUp,
  pickedUp,
  failPickup,
  pendingTransit,
  transiting,
  delivering,
  successDelivery,
  failDelivery,
  pendingReturn,
  returning,
  returned,
  canceled
}

extension EnumRole on ShipmentStatus {
  String toJsonString() {
    switch (this) {
      case ShipmentStatus.neww:
        return 'NEW';
      case ShipmentStatus.pendingPickup:
        return "PENDING_PICKUP";
      case ShipmentStatus.pickingUp:
        return "PICKING_UP";
      case ShipmentStatus.pickedUp:
        return "PICKED_UP";
      case ShipmentStatus.failPickup:
        return "FAIL_PICKUP";
      case ShipmentStatus.pendingTransit:
        return "PENDING_TRANSIT";
      case ShipmentStatus.transiting:
        return "TRANSITING";
      case ShipmentStatus.delivering:
        return "DELIVERING";
      case ShipmentStatus.successDelivery:
        return "SUCCESS_DELIVERY";
      case ShipmentStatus.failDelivery:
        return "FAIL_DELIVERY";
      case ShipmentStatus.pendingReturn:
        return "PENDING_RETURN";
      case ShipmentStatus.returning:
        return "RETURNING";
      case ShipmentStatus.returned:
        return "RETURNED";
      case ShipmentStatus.canceled:
        return "CANCELED";
    }
  }

  ShipmentStatus getType(String type) {
    switch (type) {
      case 'NEW':
        return ShipmentStatus.neww;
      case "PENDING_PICKUP":
        return ShipmentStatus.pendingPickup;
      case "PICKING_UP":
        return ShipmentStatus.pickingUp;
      case "PICKED_UP":
        return ShipmentStatus.pickedUp;
      case "FAIL_PICKUP":
        return ShipmentStatus.failPickup;
      case "PENDING_TRANSIT":
        return ShipmentStatus.pendingTransit;
      case "TRANSITING":
        return ShipmentStatus.transiting;
      case "DELIVERING":
        return ShipmentStatus.delivering;
      case "SUCCESS_DELIVERY":
        return ShipmentStatus.successDelivery;
      case "FAIL_DELIVERY":
        return ShipmentStatus.failDelivery;
      case "PENDING_RETURN":
        return ShipmentStatus.pendingReturn;
      case "RETURNING":
        return ShipmentStatus.returning;
      case "RETURNED":
        return ShipmentStatus.returned;
      case "CANCELED":
        return ShipmentStatus.canceled;
      default:
        return ShipmentStatus.neww;
    }
  }

  String display() {
    switch (this) {
      case ShipmentStatus.neww:
        return 'NEW';
      case ShipmentStatus.pendingPickup:
        return "PENDING_PICKUP";
      case ShipmentStatus.pickingUp:
        return "PICKING_UP";
      case ShipmentStatus.pickedUp:
        return "PICKED_UP";
      case ShipmentStatus.failPickup:
        return "FAIL_PICKUP";
      case ShipmentStatus.pendingTransit:
        return "PENDING_TRANSIT";
      case ShipmentStatus.transiting:
        return "TRANSITING";
      case ShipmentStatus.delivering:
        return "DELIVERING";
      case ShipmentStatus.successDelivery:
        return "SUCCESS_DELIVERY";
      case ShipmentStatus.failDelivery:
        return "FAIL_DELIVERY";
      case ShipmentStatus.pendingReturn:
        return "PENDING_RETURN";
      case ShipmentStatus.returning:
        return "RETURNING";
      case ShipmentStatus.returned:
        return "RETURNED";
      case ShipmentStatus.canceled:
        return "CANCELED";
    }
  }
}

ShipmentStatus stringToShipmentStatus(String type) {
  switch (type) {
    case 'NEW':
      return ShipmentStatus.neww;
    case "PENDING_PICKUP":
      return ShipmentStatus.pendingPickup;
    case "PICKING_UP":
      return ShipmentStatus.pickingUp;
    case "PICKED_UP":
      return ShipmentStatus.pickedUp;
    case "FAIL_PICKUP":
      return ShipmentStatus.failPickup;
    case "PENDING_TRANSIT":
      return ShipmentStatus.pendingTransit;
    case "TRANSITING":
      return ShipmentStatus.transiting;
    case "DELIVERING":
      return ShipmentStatus.delivering;
    case "SUCCESS_DELIVERY":
      return ShipmentStatus.successDelivery;
    case "FAIL_DELIVERY":
      return ShipmentStatus.failDelivery;
    case "PENDING_RETURN":
      return ShipmentStatus.pendingReturn;
    case "RETURNING":
      return ShipmentStatus.returning;
    case "RETURNED":
      return ShipmentStatus.returned;
    case "CANCELED":
      return ShipmentStatus.canceled;

    default:
      return ShipmentStatus.neww;
  }
}

String shipmentStatusToString(ShipmentStatus type) {
  switch (type) {
    case ShipmentStatus.neww:
      return 'NEW';
    case ShipmentStatus.pendingPickup:
      return "PENDING_PICKUP";
    case ShipmentStatus.pickingUp:
      return "PICKING_UP";
    case ShipmentStatus.pickedUp:
      return "PICKED_UP";
    case ShipmentStatus.failPickup:
      return "FAIL_PICKUP";
    case ShipmentStatus.pendingTransit:
      return "PENDING_TRANSIT";
    case ShipmentStatus.transiting:
      return "TRANSITING";
    case ShipmentStatus.delivering:
      return "DELIVERING";
    case ShipmentStatus.successDelivery:
      return "SUCCESS_DELIVERY";
    case ShipmentStatus.failDelivery:
      return "FAIL_DELIVERY";
    case ShipmentStatus.pendingReturn:
      return "PENDING_RETURN";
    case ShipmentStatus.returning:
      return "RETURNING";
    case ShipmentStatus.returned:
      return "RETURNED";
    case ShipmentStatus.canceled:
      return "CANCELED";
  }
}
