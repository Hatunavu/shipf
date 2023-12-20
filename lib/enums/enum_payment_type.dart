enum PaymentType { freightPrepaid, freightCollect, freightPostpaid }

extension EnumRole on PaymentType {
  String toJsonString() {
    switch (this) {
      case PaymentType.freightPrepaid:
        return 'FREIGHT_PREPAID';
      case PaymentType.freightCollect:
        return "FREIGHT_COLLECT";
      case PaymentType.freightPostpaid:
        return "FREIGHT_POSTPAID ";
    }
  }

  PaymentType getType(String type) {
    switch (type) {
      case 'FREIGHT_PREPAID':
        return PaymentType.freightPrepaid;
      case 'FREIGHT_COLLECT':
        return PaymentType.freightCollect;
      case 'FREIGHT_POSTPAID ':
        return PaymentType.freightPostpaid;
      default:
        return PaymentType.freightPrepaid;
    }
  }

  String display() {
    switch (this) {
      case PaymentType.freightPrepaid:
        return "Người gửi thanh toán ngay";
      case PaymentType.freightCollect:
        return "Người nhận thanh toán";
      case PaymentType.freightPostpaid:
        return "Người gửi thanh toán sau(Công nợ)";
    }
  }
}

PaymentType stringToPaymentType(String type) {
  switch (type) {
    case 'FREIGHT_PREPAID':
      return PaymentType.freightPrepaid;
    case 'FREIGHT_COLLECT':
      return PaymentType.freightCollect;
    case 'FREIGHT_POSTPAID ':
      return PaymentType.freightPostpaid;
    default:
      return PaymentType.freightPrepaid;
  }
}

String? paymentTypeToString(PaymentType? type) {
  switch (type!) {
    case PaymentType.freightPrepaid:
      return 'FREIGHT_PREPAID';
    case PaymentType.freightCollect:
      return 'FREIGHT_COLLECT';
    case PaymentType.freightPostpaid:
      return 'FREIGHT_POSTPAID ';
  }
}
