enum PostStatusType { neww, draft, pending, approved, rejected }

extension EnumPostStatus on PostStatusType {
  String toJsonString() {
    switch (this) {
      case PostStatusType.neww:
        return 'NEW';
      case PostStatusType.draft:
        return 'DRAFT';
      case PostStatusType.pending:
        return 'PENDING';
      case PostStatusType.approved:
        return 'APPROVED';
      case PostStatusType.rejected:
        return 'REJECTED';
    }
  }

  PostStatusType getType(String type) {
    switch (type) {
      case 'NEW':
        return PostStatusType.neww;
      case 'DRAFT':
        return PostStatusType.draft;
      case 'PENDING':
        return PostStatusType.pending;
      case 'APPROVED':
        return PostStatusType.approved;
      case 'REJECTED':
        return PostStatusType.rejected;
      default:
        return PostStatusType.neww;
    }
  }

  String display() {
    switch (this) {
      case PostStatusType.neww:
        return 'New';
      case PostStatusType.draft:
        return 'Draft';
      case PostStatusType.pending:
        return 'Pending';
      case PostStatusType.approved:
        return 'Approved';
      case PostStatusType.rejected:
        return 'Rejected';
    }
  }
}

PostStatusType stringToPostStatusType(String type) {
  switch (type) {
    case 'NEW':
      return PostStatusType.neww;
    case 'DRAFT':
      return PostStatusType.draft;
    case 'PENDING':
      return PostStatusType.pending;
    case 'APPROVED':
      return PostStatusType.approved;
    case 'REJECTED':
      return PostStatusType.rejected;
    default:
      return PostStatusType.neww;
  }
}

String postStatusTypeToString(PostStatusType type) {
  switch (type) {
    case PostStatusType.neww:
      return 'NEW';
    case PostStatusType.draft:
      return 'DRAFT';
    case PostStatusType.pending:
      return 'PENDING';
    case PostStatusType.approved:
      return 'APPROVED';
    case PostStatusType.rejected:
      return 'REJECTED';
  }
}
