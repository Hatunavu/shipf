enum RoleType { customer, shipper, bussiness }

extension EnumRole on RoleType {
  String toJsonString() {
    switch (this) {
      case RoleType.customer:
        return 'customer';
      case RoleType.shipper:
        return "shipper";
      case RoleType.bussiness:
        return "bussiness";
    }
  }

  String getType() {
    switch (this) {
      case RoleType.customer:
        return "customer";
      case RoleType.shipper:
        return "shipper";
      case RoleType.bussiness:
        return "bussiness";
    }
  }

  String display() {
    switch (this) {
      case RoleType.customer:
        return "Cá nhân";
      case RoleType.shipper:
        return "Shipper";
      case RoleType.bussiness:
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
    case 'bussiness':
      return RoleType.bussiness;
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
    case RoleType.bussiness:
      return 'bussiness';
  }
}
