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

  // otp sent with no text
  static String otpSent(String phoneNumber) {
    String maskedPhoneNumber = _maskPhoneNumber(phoneNumber);
    return 'We have sent you an access code to $maskedPhoneNumber via SMS.';
  }

  static String _maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 7) {
      return phoneNumber; // Return as is if the phone number is too short to mask
    }
    String start = phoneNumber.substring(0, 3); // First 3 digits
    String end = phoneNumber.substring(phoneNumber.length - 2); // Last 2 digits
    String masked = '*' * (phoneNumber.length - 5); // Mask the middle digits
    return '$start$masked$end';
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
    // Split the phone number into parts based on '-'
    List<String> parts = phoneNumber.split('-');

    // Extract the country code and the rest of the number
    String countryCode = parts[0];
    // try{}
    String restOfNumber = parts[1];

    // Format the rest of the number
    String formattedNumber =
        restOfNumber.replaceRange(3, 3, '-').replaceRange(6, 6, '-');

    // Combine the country code and the formatted number
    return '+($countryCode) $formattedNumber';
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
