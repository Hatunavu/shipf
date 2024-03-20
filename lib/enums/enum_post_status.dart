import 'package:flutter/material.dart';

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
        return 'Mới';
      case PostStatusType.draft:
        return 'Nháp';
      case PostStatusType.pending:
        return 'Đợi duyệt';
      case PostStatusType.approved:
        return 'Đã duyệt';
      case PostStatusType.rejected:
        return 'Từ chối';
    }
  }

  Color color() {
    switch (this) {
      case PostStatusType.neww:
        return Colors.blue;
      case PostStatusType.draft:
        return Colors.grey;
      case PostStatusType.pending:
        return Colors.orange;
      case PostStatusType.approved:
        return Colors.green;
      case PostStatusType.rejected:
        return Colors.red;
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
