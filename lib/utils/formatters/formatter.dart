import 'package:intl/intl.dart';

class SFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatTime(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('HH:mm').format(date);
  }

  static String formatLikes(int likes) {
    if (likes < 1000) {
      return likes.toString();
    } else if (likes < 1000000) {
      String formatted = (likes / 1000).toStringAsFixed(1).substring(0, 3);
      return '${formatted.endsWith('.') ? formatted.substring(0, 2) : formatted}K';
    } else if (likes < 1000000000) {
      String formatted = (likes / 1000000).toStringAsFixed(1).substring(0, 3);
      return '${formatted.endsWith('.') ? formatted.substring(0, 2) : formatted}M';
    } else {
      String formatted =
          (likes / 1000000000).toStringAsFixed(1).substring(0, 3);
      return '${formatted.endsWith('.') ? formatted.substring(0, 2) : formatted}T';
    }
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return phoneNumber.replaceRange(
          0, 3, '(${phoneNumber.substring(0, 3)}) ');
    } else if (phoneNumber.length == 11) {
      return phoneNumber.replaceRange(
          0, 4, '(${phoneNumber.substring(0, 3)}) ');
    } else {
      return phoneNumber;
    }
  }

  static String formatDob(DateTime? dob) {
    return DateFormat('dd/MM/yyyy').format(dob!);
  }
  // static String internationalFormatPhoneNumber(String phoneNumber) {
  //   if (phoneNumber.length == 10) {
  //     return '+1 ${phoneNumber}';
  //   } else {
  //     return phoneNumber;
  //   }
}
