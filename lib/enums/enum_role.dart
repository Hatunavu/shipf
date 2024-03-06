enum RoleType { customer, shipper, business, goodsOwner, logout }

extension EnumRole on RoleType {
  String toJsonString() {
    switch (this) {
      case RoleType.customer:
        return 'SYSTEM_CUSTOMER';
      case RoleType.shipper:
        return "SYSTEM_SHIPPER";
      case RoleType.business:
        return 'SYSTEM_BUSINESS';
      case RoleType.goodsOwner:
        return 'EXPRESS_GOOD_OWNER';
      case RoleType.logout:
        return "";
    }
  }

  RoleType getType(String type) {
    switch (type) {
      case 'SYSTEM_CUSTOMER':
        return RoleType.customer;
      case 'SYSTEM_SHIPPER':
        return RoleType.shipper;
      case 'SYSTEM_BUSINESS':
        return RoleType.business;
      case 'EXPRESS_GOOD_OWNER':
        return RoleType.goodsOwner;
      default:
        return RoleType.logout;
    }
  }

  String display() {
    switch (this) {
      case RoleType.customer:
        return "Cá nhân";
      case RoleType.shipper:
        return "Shipper";
      case RoleType.business:
        return "Doanh nghiệp";
      case RoleType.goodsOwner:
        return 'Chủ hàng';
      case RoleType.logout:
        return "";
    }
  }
}

RoleType stringToRoleType(String type) {
  switch (type) {
    case 'SYSTEM_CUSTOMER':
      return RoleType.customer;
    case 'SYSTEM_SHIPPER':
      return RoleType.shipper;
    case 'SYSTEM_BUSINESS':
      return RoleType.business;
    case 'EXPRESS_GOOD_OWNER':
      return RoleType.goodsOwner;
    default:
      return RoleType.logout;
  }
}

String roleTypeToString(RoleType type) {
  switch (type) {
    case RoleType.customer:
      return 'SYSTEM_CUSTOMER';
    case RoleType.shipper:
      return 'SYSTEM_SHIPPER';
    case RoleType.business:
      return 'SYSTEM_BUSINESS';
    case RoleType.goodsOwner:
      return 'EXPRESS_GOOD_OWNER';
    case RoleType.logout:
      return "";
  }
}
