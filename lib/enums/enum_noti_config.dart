enum NotiConfig { noNotification, onlyActiveZone, allNotification }

extension Enum on NotiConfig {
  String toJsonString() {
    switch (this) {
      case NotiConfig.noNotification:
        return 'NO_NOTIFICATION';
      case NotiConfig.onlyActiveZone:
        return "ONLY_ACTIVE_ZONE";
      case NotiConfig.allNotification:
        return "ALL_NOTIFICATION ";
    }
  }

  NotiConfig getType(String type) {
    switch (type) {
      case 'NO_NOTIFICATION':
        return NotiConfig.noNotification;
      case 'ONLY_ACTIVE_ZONE':
        return NotiConfig.onlyActiveZone;
      case 'ALL_NOTIFICATION ':
        return NotiConfig.allNotification;
      default:
        return NotiConfig.noNotification;
    }
  }

  String display() {
    switch (this) {
      case NotiConfig.noNotification:
        return "Không nhận thông báo";
      case NotiConfig.onlyActiveZone:
        return "Thông báo khu vực vận chuyển hoạt động";
      case NotiConfig.allNotification:
        return "Tất cả thông báo";
    }
  }
}

NotiConfig stringToNotiConfig(String type) {
  switch (type) {
    case 'NO_NOTIFICATION':
      return NotiConfig.noNotification;
    case 'ONLY_ACTIVE_ZONE':
      return NotiConfig.onlyActiveZone;
    case 'ALL_NOTIFICATION ':
      return NotiConfig.allNotification;
    default:
      return NotiConfig.noNotification;
  }
}

String? notiConfigToString(NotiConfig? type) {
  switch (type!) {
    case NotiConfig.noNotification:
      return 'NO_NOTIFICATION';
    case NotiConfig.onlyActiveZone:
      return 'ONLY_ACTIVE_ZONE';
    case NotiConfig.allNotification:
      return 'ALL_NOTIFICATION ';
  }
}
