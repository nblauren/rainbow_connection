class ChatUtils {
  static String formatMessage(String sender, String text) {
    // Format a chat message with sender's name and message text
    return '$sender: $text';
  }

  static String formatTimestamp(DateTime timestamp) {
    // Format a timestamp as a string (e.g., "Today, 12:30 PM")
    final now = DateTime.now();
    if (timestamp.year == now.year &&
        timestamp.month == now.month &&
        timestamp.day == now.day) {
      // Message sent today
      return 'Today, ${_formatTime(timestamp)}';
    } else {
      // Message sent on a different day
      return '${_formatDate(timestamp)}, ${_formatTime(timestamp)}';
    }
  }

  static String _formatDate(DateTime date) {
    return '${_monthToString(date.month)} ${date.day}, ${date.year}';
  }

  static String _formatTime(DateTime time) {
    return '${time.hour}:${_formatNumber(time.minute)} ${_getAMPM(time)}';
  }

  static String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  static String _getAMPM(DateTime time) {
    return time.hour < 12 ? 'AM' : 'PM';
  }

  static String _monthToString(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  static String getProfileAvatar(String username) {
    // Generate a placeholder avatar URL based on the username
    return 'https://avatars.example.com/$username.png';
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    // Check if two dates are on the same day
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static String formatDuration(Duration duration) {
    // Format a duration in the format HH:MM:SS
    final hours = duration.inHours;
    final minutes = (duration.inMinutes % 60);
    final seconds = (duration.inSeconds % 60);

    return '$hours:${_formatNumber(minutes)}:${_formatNumber(seconds)}';
  }

  static String maskPhoneNumber(String phoneNumber) {
    // Mask the middle digits of a phone number
    if (phoneNumber.length == 10) {
      return '${phoneNumber.substring(0, 3)}-XXX-${phoneNumber.substring(6)}';
    }
    return phoneNumber; // Not a valid phone number
  }

  static String emojiFlags(String countryCode) {
    // Get an emoji flag based on the country code
    final codeUnits = countryCode.codeUnits;
    if (codeUnits.length == 2) {
      final firstLetter = codeUnits[0] + 127397;
      final secondLetter = codeUnits[1] + 127397;
      return String.fromCharCode(firstLetter) +
          String.fromCharCode(secondLetter);
    }
    return '';
  }

  static String truncateMessage(String message, {int maxLength = 50}) {
    // Truncate a message to a specified maximum length
    if (message.length > maxLength) {
      return '${message.substring(0, maxLength)}...';
    }
    return message;
  }

  static String getRainbowFlag() {
    // Get the rainbow flag emoji
    return '🏳️‍🌈';
  }
}
