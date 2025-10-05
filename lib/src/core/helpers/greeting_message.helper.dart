class GreetingMessageHelper {
  static String show(DateTime date) {
    String? message;

    if (date.isAfter(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 6, 0, 0)) &&
        date.isBefore(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0, 0))) {
      message = 'Selamat Pagi';
    }

    if (date.isAfter(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0, 0)) &&
        date.isBefore(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 15, 0, 0))) {
      message = 'Selamat Siang';
    }

    if (date.isAfter(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 15, 0, 0)) &&
        date.isBefore(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 18, 0, 0))) {
      message = 'Selamat Sore';
    }

    if (date.isAfter(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 18, 0, 0)) &&
        date.isBefore(DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 6, 0, 0))) {
      message = 'Selamat Malam';
    }

    return message ?? 'Selamat Datang';
  }
}
