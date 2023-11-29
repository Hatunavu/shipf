import 'package:shipf/foundation/constant.dart';

enum StepOrderType { address, parcel, fee }

extension EnumRole on StepOrderType {
  String toJsonString() {
    switch (this) {
      case StepOrderType.address:
        return 'address';
      case StepOrderType.parcel:
        return "parcel";
      case StepOrderType.fee:
        return "fee";
    }
  }

  String getType() {
    switch (this) {
      case StepOrderType.address:
        return "address";
      case StepOrderType.parcel:
        return "parcel";
      case StepOrderType.fee:
        return "fee";
    }
  }

  String display() {
    switch (this) {
      case StepOrderType.address:
        return text.address;
      case StepOrderType.parcel:
        return text.parcel;
      case StepOrderType.fee:
        return text.fee;
    }
  }

  String displayNumber() {
    switch (this) {
      case StepOrderType.address:
        return "1";
      case StepOrderType.parcel:
        return "2";
      case StepOrderType.fee:
        return "3";
    }
  }
}

StepOrderType stringToStepOrderType(String type) {
  switch (type) {
    case 'address':
      return StepOrderType.address;
    case 'parcel':
      return StepOrderType.parcel;
    case 'fee':
      return StepOrderType.fee;
    default:
      return StepOrderType.address;
  }
}

String stepOrderTypeToString(StepOrderType type) {
  switch (type) {
    case StepOrderType.address:
      return 'address';
    case StepOrderType.parcel:
      return 'parcel';
    case StepOrderType.fee:
      return 'fee';
  }
}
