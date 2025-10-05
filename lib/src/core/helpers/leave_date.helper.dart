class LeaveDateHelper {
  static String? getChangeOfLeaveDate(
    List<DateTime> dateOfApplication,
    List<DateTime> selectedDates,
  ) {
    List<DateTime> dates = [];
    String result = '';

    for (var element in selectedDates) {
      if (!dateOfApplication.contains(element)) {
        dates.add(element);
      }
    }

    return result;
  }
}
