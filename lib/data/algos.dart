// ignore_for_file: curly_braces_in_flow_control_structures

class Algos {
  static String ordinal(int number) {
    if (number == 1 || number == 21 || number == 31)
      return 'st';
    else if (number == 2 || number == 22)
      return 'nd';
    else if (number == 3 || number == 23)
      return 'rd';
    else
      return 'th';
  }
}
