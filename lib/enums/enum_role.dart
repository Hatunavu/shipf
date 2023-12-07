enum RoleType { customer, shipper, business }

extension EnumRole on RoleType {
  String toJsonString() {
    switch (this) {
      case RoleType.customer:
        return 'customer';
      case RoleType.shipper:
        return "shipper";
      case RoleType.business:
        return "business";
    }
  }

  String getType() {
    switch (this) {
      case RoleType.customer:
        return "customer";
      case RoleType.shipper:
        return "shipper";
      case RoleType.business:
        return "business";
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
    }
  }
}

RoleType stringToRoleType(String type) {
  switch (type) {
    case 'customer':
      return RoleType.customer;
    case 'shipper':
      return RoleType.shipper;
    case 'business':
      return RoleType.business;
    default:
      return RoleType.customer;
  }
}

String roleTypeToString(RoleType type) {
  switch (type) {
    case RoleType.customer:
      return 'customer';
    case RoleType.shipper:
      return 'shipper';
    case RoleType.business:
      return 'business';
  }
}
