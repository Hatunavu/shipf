enum ZoneType { pickupZone, deliveryZone }

extension EnumRole on ZoneType {
  String toJsonString() {
    switch (this) {
      case ZoneType.pickupZone:
        return 'PICKUP_ZONE';
      case ZoneType.deliveryZone:
        return 'DELIVERY_ZONE';
    }
  }

  ZoneType getType(String type) {
    switch (type) {
      case 'PICKUP_ZONE':
        return ZoneType.pickupZone;
      case 'DELIVERY_ZONE':
        return ZoneType.deliveryZone;
      default:
        return ZoneType.deliveryZone;
    }
  }

  String display() {
    switch (this) {
      case ZoneType.pickupZone:
        return "Khu vực nhận hàng";
      case ZoneType.deliveryZone:
        return "Khu vực trả hàng";
    }
  }
}

ZoneType stringToZoneType(String type) {
  switch (type) {
    case 'PICKUP_ZONE':
      return ZoneType.pickupZone;
    case 'DELIVERY_ZONE':
      return ZoneType.deliveryZone;
    default:
      return ZoneType.deliveryZone;
  }
}

String zoneTypeToString(ZoneType type) {
  switch (type) {
    case ZoneType.pickupZone:
      return 'PICKUP_ZONE';
    case ZoneType.deliveryZone:
      return 'DELIVERY_ZONE';
  }
}
