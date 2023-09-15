import 'package:dotnetstrftime/dotnetstrftime.dart';

void main() {
  // May 8th, 2023 T 2:42:33.2332
  var dtWithEmptyMilliseconds = DateTime(2023, 05, 08, 14, 42, 50, 000, 678);

  // Formatting with a raw character
  dtWithEmptyMilliseconds.formatAsDotNET("dd"); // "05"

  // Formatting with pre-defined tokens
  dtWithEmptyMilliseconds.formatAsDotNET(DateTimeFormatTokenTypeDotNet.dd.str); // "05"

  // Formatting with a singleton token
  dtWithEmptyMilliseconds.formatAsDotNET("d"); // "5/8/2023"

  // Formatting with custom interjections. Surrounding the element in quotations is a string literal that won't be parsed for tokens
  dtWithEmptyMilliseconds.formatAsDotNET('dd "xyz"'); // "05 xyz"

  /// Catching invalid formatting:
  try {
    // Notice that the closing quotation-mark is missing. This is invalid.
    dtWithEmptyMilliseconds.formatAsDotNET('"pst');
  } on DateTimeFormatException catch (e) {
    print(e);
  }
}
