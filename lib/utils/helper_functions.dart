class HelperFunctions {
  static String getHumanDate(String date) {
    List<String> parsed = date.split('-');

    return '${getMonthName(parsed[1])} ${parsed[2]}, ${parsed[0]}';
  }

  static String getMonthName(String monthNumber) {
    switch (monthNumber) {
      case '01':
        return 'Janurary';
      case '02':
        return 'February';
      case '03':
        return 'March';
      case '04':
        return 'April';
      case '05':
        return 'May';
      case '06':
        return 'June';
      case '07':
        return 'July';
      case '08':
        return 'August';
      case '09':
        return 'September';
      case '10':
        return 'October';
      case '11':
        return 'November';
      case '12':
        return 'December';
      default:
        return '';
    }
  }
}
