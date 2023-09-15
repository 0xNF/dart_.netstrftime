Dart package that offers support for formatting DateTime's according to the same rules as [.NET does](https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings) with their Format Strings.

There are some quirks: Because this package is based on both [Intl](https://pub.dev/packages/intl) and [Timezone](https://pub.dev/packages/timezone), some of the formatting available doesn't line up 1:1 with .NET. as an example, using the italian locale `it`, the time separator should return `.`, but instead it currently returns `:`. For the most part, the mismatches are small.

# Usage

# Supported Tokens

| Token   | .NET    | This Dart Package| Description | Output |
| --------| :-----: | :-------------:  | :---------: | :----: |
| d       | ✅      | ✅              | Short date pattern. | 2009-06-15T13:45:30 -> 6/15/2009 (en-US) |
| dd      | ✅      | ✅              | Day of month pattern | 2009-06-01T13:45:30 -> 01 |
| ddd     | ✅      | ✅              | Abbreviated Day of month pattern | 2009-06-15T13:45:30 -> Mon (en-US) |
| dddd    | ✅      | ✅              | Full day of month pattern | 2009-06-15T13:45:30 -> Monday (en-US) |
| D       | ✅      | ✅              | Long date pattern. | 2009-06-15T13:45:30 -> Monday, June 15, 2009 (en-US) |
| f       | ✅      | ✅              | Full date/time pattern (short time). | 2009-06-15T13:45:30 -> Monday, June 15, 2009 1:45 PM (en-US) |
| ff      | ✅      | ✅              | Hundreths of seconds | 2009-06-15T13:45:30.617542 -> 61 |
| fff     | ✅      | ✅              | The milliseconds in a date and time value. | 6/15/2009 13:45:30.617542 -> 617 |
| ffff    | ✅      | ✅              | The ten thousandths of a second in a date and time value.  | 2009-06-15T13:45:30.617542 -> 6175 |
| fffff   | ✅      | ✅              | The hundred thousandths of a second in a date and time value. | 2009-06-15T13:45:30.617542 -> 61754 |
| ffffff  | ✅      | ✅              | The millionths of a second in a date and time value. | 2009-06-15T13:45:30.6175420 -> 617542 |
| fffffff | ✅      | ✅              | The ten millionths of a second in a date and time value. | 2009-06-15T13:45:30.6175425 -> 6175425 |
| F       | ✅      | ✅              | Full date/time pattern (long time). | 2009-06-15T13:45:30 -> Monday, June 15, 2009 1:45:30 PM (en-US) |
| FF      | ✅      | ✅              | If non-zero, Hundreths of seconds | 2009-06-15T13:45:30.617542 -> 61<br>2009-06-15T13:45:30.0050000 -> (no output) | |  |
| FFF     | ✅      | ✅              | If non-zero, The milliseconds in a date and time value |  2009-06-15T13:45:30.617542 -> 61<br>2009-06-15T13:45:30.0050000 -> (no output) |
| FFFF    | ✅      | ✅              | If non-zero, The ten thousandths of a second in a date and time value. |  2009-06-15T13:45:30.617542 -> 617<br>2009-06-15T13:45:30.0050000 -> (no output) |
| FFFFF   | ✅      | ✅              | If non-zero, The hundred thousandths of a second in a date and time value. |  2009-06-15T13:45:30.617542 -> 6175<br>2009-06-15T13:45:30.0050000 -> (no output) |
| FFFFFF  | ✅      | ✅              | If non-zero, The millionths of a second in a date and time value. |  2009-06-15T13:45:30.617542 -> 61754<br>2009-06-15T13:45:30.0050000 -> (no output) |
| FFFFFFF | ✅      | ✅              | If non-zero, The ten millionths of a second in a date and time value. |  2009-06-15T13:45:30.617542 -> 617542<br>2009-06-15T13:45:30.0050000 -> (no output) |
| g       | ✅      | ✅              | General date/time pattern (short time). | 2009-06-15T13:45:30 -> 6/15/2009 1:45 PM (en-US) |
| gg      | ✅      | ✅              |  |  |
| G       | ✅      | ✅              | General date/time pattern (long time). | 2009-06-15T13:45:30 -> 6/15/2009 1:45:30 PM (en-US) |
| h       | ✅      | ✅              | The hour, using a 12-hour clock from 1 to 12. |  2009-06-15T01:45:30 -> 1<br>2009-06-15T13:45:30 -> 1 |
| hh      | ✅      | ✅              | The hour, using a 12-hour clock from 01 to 12. | 2009-06-15T01:45:30 -> 01<br>2009-06-15T13:45:30 -> 01 |
| H       | ✅      | ✅              | The hour, using a 24-hour clock from 0 to 23. | 2009-06-15T01:45:30 -> 1<br>2009-06-15T13:45:30 -> 13 |
| HH      | ✅      | ✅              | The hour, using a 24-hour clock from 00 to 23 | 2009-06-15T01:45:30 -> 01<br>2009-06-15T13:45:30 -> 13 |
| K       | ✅      | ✅              |  |  |
| m       | ✅      | ✅              | Month/day pattern. | 2009-06-15T13:45:30 -> June 15 (en-US) |
| mm      | ✅      | ✅              |  |  |
| M       | ✅      | ✅              | Month/day pattern. | 2009-06-15T13:45:30 -> June 15 (en-US) |
| MM      | ✅      | ✅              | The month, from 01 through 12.  | 2009-06-15T13:45:30 -> 06 |
| MMM     | ✅      | ✅              | The abbreviated name of the month.  | 2009-06-15T13:45:30 -> Jun (en-US) |
| MMMM    | ✅      | ✅              | The full name of the month.  | 2009-06-15T13:45:30 -> June (en-US) |
| o       | ✅      | ✅              | round-trip date/time pattern. | 2009-06-15T13:45:30-07:00 --> 2009-06-15T13:45:30.0000000-07:00 |
| O       | ✅      | ✅              | round-trip date/time pattern. | 2009-06-15T13:45:30-07:00 --> 2009-06-15T13:45:30.0000000-07:00 |
| r       | ✅      | ✅              | RFC1123 pattern. | 2009-06-15T13:45:30 -> Mon, 15 Jun 2009 13:45:30 GMT |
| R       | ✅      | ✅              | RFC1123 pattern. | 2009-06-15T13:45:30 -> Mon, 15 Jun 2009 13:45:30 GMT |
| s       | ✅      | ✅              | Sortable date/time pattern. |  2009-06-15T13:45:30 -> 2009-06-15T13:45:30 |
| ss      | ✅      | ✅              | The second, from 00 through 59. | 2009-06-15T13:45:09 -> 09 |
| t       | ✅      | ✅              | Short time pattern. | 2009-06-15T13:45:30 -> 1:45 PM (en-US) |
| tt      | ✅      | ✅              | The AM/PM designator. | 009-06-15T13:45:30 -> PM (en-US) |
| T       | ✅      | ✅              | Long time pattern. | 2009-06-15T13:45:30 -> 1:45:30 PM (en-US) |
| TT      | ✅      | X               |  |  |
| u       | ✅      | ✅              | Universal sortable date/time pattern. | 2009-06-15T13:45:30 -> 2009-06-15 20:45:30Z |
| U       | ✅      | ✅              | Universal full date/time pattern. | 2009-06-15T13:45:30 -> Monday, June 15, 2009 8:45:30 PM (en-US) |
| y       | ✅      | ✅              | Year month pattern. | 2009-06-15T13:45:30 -> June 2009 (en-US) |
| yy      | ✅      | ✅              | The year, from 00 to 99. | 0001-01-01T00:00:00 -> 01 |
| yyy     | ✅      | ✅              |  The year, with a minimum of three digits. | 0001-01-01T00:00:00 -> 001 |
| yyyy    | ✅      | ✅              |The year as a four-digit number.   |  0001-01-01T00:00:00 |
| yyyyy   | ✅      | ✅              | The year as a five-digit number |  0001-01-01T00:00:00 -> 00001 |
| Y       | ✅      | ✅              |  |  |
| z       | ✅      | ✅              |  |  |
| zz      | ✅      | ✅              |  Hours offset from UTC, with a leading zero for a single-digit value | 2009-06-15T13:45:30-07:00 -> -07 |
| zzz     | ✅      | ✅              | Hours and minutes offset from UTC. | 2009-06-15T13:45:30-07:00 -> -07:00 |
| \       | ✅      | ✅              | Escape character | 987654 "\###00\#" -> #987654# |
| 'string'| ✅      | ✅              | Literal string delimiter | 68 "#" "degrees" -> 68 degrees |
| 0       | ✅      | X              | Zero placeholder | 1234.5678 ("00000") -> 01235 |
| #       | ✅      | X              | Digit placeholder | 1234.5678 ("#####") -> 1235 |
| .       | ✅      | X              | Decimal point | 0.45678 ("0.00", en-US) -> 0.46 |
| ,       | ✅      | X              | Group separator and number scaling |  2147483647 ("##,#", en-US) -> 2,147,483,647 |
| ;       | ✅      | X              | Section separator | 0.3697 ("%#0.00", en-US) -> %36.97 |
| %       | ✅      | X              | Percentage placeholder | 0.3697 ("%#0.00", en-US) -> %36.97 |
| ‰       | ✅      | X              | Per mille placeholder | 0.03697 ("#0.00‰", en-US) -> 36.97‰ |
| E0      | ✅      | X              | Exponential notation |  |
| E+0     | ✅      | X              | Exponential notation |  |
| E-0     | ✅      | X              | Exponential notation |  |
| e0      | ✅      | X              | Exponential notation | 987654 ("#0.0e0") -> 98.8e4 |
| e+0     | ✅      | X              | Exponential notation | 1.8901385E-16 ("0.0e+00") -> 1.9e-16 |
| e-0     | ✅      | X              | Exponential notation |  |








# String Literals

# Contributing

To contribute to this library, consider contributing to the underlying [Timezone](https://pub.dev/packages/timezone), or filing issues with [Intl](https://pub.dev/packages/intl). For changes to this actual package, visit the github at https://github.com/0xNF/dart_.netstrftime