enum TransitStatus { neww, inProgress, finish, done, canceled }

extension EnumTransitStatus on TransitStatus {
  String toJsonString() {
    switch (this) {
      case TransitStatus.neww:
        return 'NEW';
      case TransitStatus.inProgress:
        return "IN_PROGRESS";
      case TransitStatus.finish:
        return "FINISH";
      case TransitStatus.done:
        return "DONE";
      case TransitStatus.canceled:
        return "CANCELED";
    }
  }

  TransitStatus getType(String type) {
    switch (type) {
      case 'NEW':
        return TransitStatus.neww;
      case 'IN_PROGRESS':
        return TransitStatus.inProgress;
      case 'FINISH':
        return TransitStatus.finish;
      case 'DONE':
        return TransitStatus.done;
      case 'CANCELED':
        return TransitStatus.canceled;
      default:
        return TransitStatus.neww;
    }
  }

  String display() {
    switch (this) {
      case TransitStatus.neww:
        return 'Chuyến mới';
      case TransitStatus.inProgress:
        return "Đang thực hiện";
      case TransitStatus.finish:
        return "Hoàn thành";
      case TransitStatus.done:
        return "Kết thúc";
      case TransitStatus.canceled:
        return "Huỷ bỏ";
    }
  }
}

TransitStatus stringToTransitStatus(String type) {
  switch (type) {
    case 'NEW':
      return TransitStatus.neww;
    case 'IN_PROGRESS':
      return TransitStatus.inProgress;
    case 'FINISH':
      return TransitStatus.finish;
    case 'DONE':
      return TransitStatus.done;
    case 'CANCELED':
      return TransitStatus.canceled;
    default:
      return TransitStatus.neww;
  }
}

String transitStatusToString(TransitStatus type) {
  switch (type) {
    case TransitStatus.neww:
      return 'NEW';
    case TransitStatus.inProgress:
      return "IN_PROGRESS";
    case TransitStatus.finish:
      return "FINISH";
    case TransitStatus.done:
      return "DONE";
    case TransitStatus.canceled:
      return "CANCELED";
  }
}
