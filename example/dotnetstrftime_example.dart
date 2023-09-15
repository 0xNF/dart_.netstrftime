import 'package:dotnetstrftime/dotnetstrftime.dart';
import 'package:dotnetstrftime/src/format_token_type.dart';

void main() {
  // May 8th, 2023 T 2:42:33.2332
  var dtWithEmptyMilliseconds = DateTime(2023, 05, 08, 14, 42, 50, 000, 678);

  // Formatting with a raw character
  dtWithEmptyMilliseconds.formatAsDotNET("d"); // "5/8/2023"

  // Formatting with pre-defined tokens
  dtWithEmptyMilliseconds.formatAsDotNET(DateTimeFormatTokenTypeDotNet.d.str); // "5/8/2023"

  // Formatting with custom interjections. Surrounding the element in quotations is a string literal that won't be parsed for tokens
  dtWithEmptyMilliseconds.formatAsDotNET('d "xyz"'); // "5/8/2023 xyz"

  /// Catching invalid formatting:
  try {
    // Notice that the closing quotation-mark is missing. This is invalid.
    dtWithEmptyMilliseconds.formatAsDotNET('"pst');
  } on DateTimeFormatException catch (e) {
    print(e);
  }
}
