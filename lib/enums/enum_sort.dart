enum SortType { asc, desc }

extension EnumRort on SortType {
  String toJsonString() {
    switch (this) {
      case SortType.asc:
        return 'ASC';
      case SortType.desc:
        return 'DESC';
    }
  }

  SortType getType(String type) {
    switch (type) {
      case 'ASC':
        return SortType.asc;
      case 'DESC':
        return SortType.desc;
      default:
        return SortType.asc;
    }
  }

  String display() {
    switch (this) {
      case SortType.asc:
        return "Tăng dần";
      case SortType.desc:
        return "Giảm dần";
    }
  }
}

SortType stringToSortType(String type) {
  switch (type) {
    case 'ASC':
      return SortType.asc;
    case 'DESC':
      return SortType.desc;
    default:
      return SortType.asc;
  }
}

String sortTypeToString(SortType type) {
  switch (type) {
    case SortType.asc:
      return 'ASC';
    case SortType.desc:
      return 'DESC';
  }
}
