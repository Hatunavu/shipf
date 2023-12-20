enum SourceType { form, excel }

extension EnumRole on SourceType {
  String toJsonString() {
    switch (this) {
      case SourceType.form:
        return 'FORM';
      case SourceType.excel:
        return "EXCEL";
    }
  }

  SourceType getType(String type) {
    switch (type) {
      case 'FORM':
        return SourceType.form;
      case 'EXCEL':
        return SourceType.excel;
      default:
        return SourceType.excel;
    }
  }

  String display() {
    switch (this) {
      case SourceType.form:
        return "Form";
      case SourceType.excel:
        return "Excel";
    }
  }
}

SourceType stringToSourceType(String type) {
  switch (type) {
    case 'FORM':
      return SourceType.form;
    case 'EXCEL':
      return SourceType.excel;
    default:
      return SourceType.excel;
  }
}

String sourceTypeToString(SourceType type) {
  switch (type) {
    case SourceType.form:
      return 'FORM';
    case SourceType.excel:
      return 'EXCEL';
  }
}
