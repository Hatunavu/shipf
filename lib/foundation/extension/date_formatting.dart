import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String tohhmmddMMyyyy() {
    final f = DateFormat('hh:mm dd/MM/yyyy');
    return f.format(this);
  }

  String toyyyy() {
    final f = DateFormat('yyyy');
    return f.format(this);
  }

  String toddMMyyyy() {
    final f = DateFormat('dd/MM/yyyy');
    return f.format(this);
  }

  String toLocalTime() {
    final f = DateFormat('dd/MM/yyyy');
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }

  String toEEEMMMd() {
    // final f = DateFormat('EEE, MMM d');
    final f = DateFormat.MMMEd('vi_VN');
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }

  String toEEEMMMdY() {
    // final f = DateFormat('EEE, MMM d');
    final f = DateFormat.yMMMEd('vi_VN');
    var dateUtc = toUtc();
    var dateLocal = dateUtc.toLocal();
    return f.format(dateLocal);
  }
}
