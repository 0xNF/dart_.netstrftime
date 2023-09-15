/// Supported .NET strftime tokens, such as `d`, or `ffff`, or `K`, etc
enum DateTimeFormatTokenTypeDotNet {
  /// The day of the month, from 1 through 31.
  /// 2009-06-01T13:45:30 -> 1
  d('d'),

  /// The day of the month, from 01 through 31.
  /// 2009-06-01T13:45:30 -> 01
  dd('dd'),

  /// The abbreviated name of the day of the week.
  /// 2009-06-15T13:45:30 -> Mon (en-US)
  /// 2009-06-15T13:45:30 -> 月 (ja-JP)
  ddd('ddd'),

  /// 2009-06-15T13:45:30 -> Monday (en-US)
  /// 2009-06-15T13:45:30 -> 月曜日 (ja-JP)
  dddd('dddd'),

  /// The tenths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6170000 -> 6
  f('f'),

  /// The hundredths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6170000 -> 61
  ff('ff'),

  /// The milliseconds in a date and time value.
  /// 6/15/2009 13:45:30.617 -> 617
  fff('fff'),

  /// The ten thousandths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6175000 -> 6175
  ffff('ffff'),

  /// The hundred thousandths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6175400 -> 61754
  fffff('fffff'),

  /// The millionths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6175420 -> 617542
  ffffff('ffffff'),

  /// The ten millionths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6175425 -> 6175425
  fffffff('fffffff'),

  /// If non-zero, the hundredths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6170000 -> 6
  ///  2009-06-15T13:45:30.0050000 -> (no output)
  // ignore: constant_identifier_names
  F('F'),

  /// If non-zero, the hundredths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6170000 -> 61
  ///  2009-06-15T13:45:30.0050000 -> (no output)
  // ignore: constant_identifier_names
  FF('FF'),

  /// The milliseconds in a date and time value.
  /// 6/15/2009 13:45:30.617 -> 617
  ///  2009-06-15T13:45:30.0050000 -> (no output)
  // ignore: constant_identifier_names
  FFF('FFF'),

  /// The ten thousandths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6175000 -> 6175
  ///  2009-06-15T13:45:30.0050000 -> (no output)
  // ignore: constant_identifier_names
  FFFF('FFFF'),

  /// If non-zero, the hundred thousandths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6175400 -> 61754
  ///  2009-06-15T13:45:30.0050000 -> (no output)
  // ignore: constant_identifier_names
  FFFFF('FFFFF'),

  /// If non-zero, The millionths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6175420 -> 617542
  ///  2009-06-15T13:45:30.0050000 -> (no output)
  // ignore: constant_identifier_names
  FFFFFF('FFFFFF'),

  /// If non-zero, The ten millionths of a second in a date and time value.
  /// 2009-06-15T13:45:30.6175425 -> 6175425
  /// 2009-06-15T13:45:30.0001150 -> 000115
  // ignore: constant_identifier_names
  FFFFFFF('FFFFFFF'),

  /// The period or era. (g)
  /// 2009-06-15T13:45:30.6170000 -> A.D.
  g('g'),

  /// The period or era. (gg)
  /// 2009-06-15T13:45:30.6170000 -> A.D.
  gg('gg'),

  /// The hour, using a 12-hour clock from 1 to 12. (h)
  ///
  /// 2009-06-15T01:45:30 -> 1
  /// 2009-06-15T13:45:30 -> 1
  h("h"),

  /// The hour, using a 12-hour clock from 01 to 12. (hh)
  /// 2009-06-15T01:45:30 -> 01
  /// 2009-06-15T13:45:30 -> 01
  hh("hh"),

  /// The hour, using a 24-hour clock from 0 to 23. (H)
  /// 2009-06-15T01:45:30 -> 1
  /// 2009-06-15T13:45:30 -> 13
  // ignore: constant_identifier_names
  H("H"),

  /// The hour, using a 24-hour clock from 00 to 23.(HH)
  /// 2009-06-15T01:45:30 -> 01
  /// 2009-06-15T13:45:30 -> 13
  // ignore: constant_identifier_names
  HH("HH"),

  /// Time zone information. (k)
  /// With DateTime values:
  ///
  /// 2009-06-15T13:45:30, Kind Unspecified ->
  ///
  /// 2009-06-15T13:45:30, Kind Utc -> Z
  ///
  /// 2009-06-15T13:45:30, Kind Local -> -07:00 (depends on local computer settings)
  ///
  /// With DateTimeOffset values:
  ///
  /// 2009-06-15T01:45:30-07:00 --> -07:00
  ///
  /// 2009-06-15T08:45:30+00:00 --> +00:00
  K("K"),

  /// The minute, from 0 through 59. (m)
  /// 2009-06-15T01:09:30 -> 9
  /// 2009-06-15T13:29:30 -> 29
  m("m"),

  /// The minute, from 00 through 59. (mm)
  /// 2009-06-15T01:09:30 -> 09
  /// 2009-06-15T01:45:30 -> 45
  mm("mm"),

  /// The month, from 1 through 12. (M)
  /// 2009-06-15T13:45:30 -> 6
  // ignore: constant_identifier_names
  M("M"),

  /// The month, from 01 through 12. (MM)
  /// 2009-06-15T13:45:30 -> 06
  // ignore: constant_identifier_names
  MM("MM"),

  /// The abbreviated name of the month. (MMM)
  /// 2009-06-15T13:45:30 -> Jun (en-US)
  /// 2009-06-15T13:45:30 -> juin (fr-FR)
  /// 2009-06-15T13:45:30 -> Jun (zu-ZA)
  // ignore: constant_identifier_names
  MMM("MMM"),

  /// The full name of the month. (MMMM)
  /// 2009-06-15T13:45:30 -> June (en-US)
  /// 2009-06-15T13:45:30 -> juni (da-DK)
  /// 2009-06-15T13:45:30 -> uJuni (zu-ZA)
  // ignore: constant_identifier_names
  MMMM("MMMM"),

  /// The second, from 0 through 59. (s)
  /// 2009-06-15T13:45:09 -> 9
  s("s"),

  /// The second, from 00 through 59. (ss)
  /// 2009-06-15T13:45:09 -> 09
  ss("ss"),

  /// The first character of the AM/PM designator. (t)
  /// 2009-06-15T13:45:30 -> P (en-US)
  /// 2009-06-15T13:45:30 -> 午 (ja-JP)
  /// 2009-06-15T13:45:30 -> (fr-FR)
  t("t"),

  /// The AM/PM designator. (tt)
  /// 2009-06-15T13:45:30 -> PM (en-US)
  /// 2009-06-15T13:45:30 -> 午後 (ja-JP)
  /// 2009-06-15T13:45:30 -> (fr-FR)
  tt("tt"),

  /// The year, from 0 to 99. (y)
  /// 0001-01-01T00:00:00 -> 1
  /// 0900-01-01T00:00:00 -> 0
  /// 1900-01-01T00:00:00 -> 0
  /// 2009-06-15T13:45:30 -> 9
  /// 2019-06-15T13:45:30 -> 19
  y("y"),

  /// The year, from 00 to 99. (yy)
  /// 0001-01-01T00:00:00 -> 01
  /// 0900-01-01T00:00:00 -> 00
  /// 1900-01-01T00:00:00 -> 00
  /// 2019-06-15T13:45:30 -> 19
  yy("yy"),

  /// The year, with a minimum of three digits. (yyy)
  /// 0001-01-01T00:00:00 -> 001
  /// 0900-01-01T00:00:00 -> 900
  /// 1900-01-01T00:00:00 -> 1900
  /// 2009-06-15T13:45:30 -> 2009
  yyy("yyy"),

  /// The year as a four-digit number. (yyyy)
  /// 0001-01-01T00:00:00 -> 0001
  /// 0900-01-01T00:00:00 -> 0900
  /// 1900-01-01T00:00:00 -> 1900
  /// 2009-06-15T13:45:30 -> 2009
  yyyy("yyyy"),

  /// The year as a five-digit number. (yyyyy)
  /// 0001-01-01T00:00:00 -> 00001
  /// 2009-06-15T13:45:30 -> 02009
  yyyyy("yyyyy"),

  /// Hours offset from UTC, with no leading zeros. (z)
  /// 2009-06-15T13:45:30-07:00 -> -7
  z("z"),

  /// Hours offset from UTC, with a leading zero for a single-digit value. (zz)
  /// 2009-06-15T13:45:30-07:00 -> -07
  zz("zz"),

  /// Hours and minutes offset from UTC. (zzz)
  /// 2009-06-15T13:45:30-07:00 -> -07:00
  zzz("zzz"),

  /// Short date pattern (d)
  /// 2009-06-15T13:45:30 -> 6/15/2009 (en-US)
  /// 2009-06-15T13:45:30 -> 15/06/2009 (fr-FR)
  /// 2009-06-15T13:45:30 -> 2009/06/15 (ja-JP)
  shortDate('d'),

  /// Long date pattern. (D)
  /// 2009-06-15T13:45:30 -> Monday, June 15, 2009 (en-US)
  /// 2009-06-15T13:45:30 -> понедельник, 15 июня 2009 г. (ru-RU)
  /// 2009-06-15T13:45:30 -> Montag, 15. Juni 2009 (de-DE)
  longDate('D'),

  /// Full date/time pattern (short time). (f)
  /// 2009-06-15T13:45:30 -> Monday, June 15, 2009 1:45 PM (en-US)
  /// 2009-06-15T13:45:30 -> den 15 juni 2009 13:45 (sv-SE)
  /// 2009-06-15T13:45:30 -> Δευτέρα, 15 Ιουνίου 2009 1:45 μμ (el-GR)
  fullDateTimeShortTime('f'),

  /// Full date/time pattern (long time). (F)
  /// 2009-06-15T13:45:30 -> Monday, June 15, 2009 1:45:30 PM (en-US)
  /// 2009-06-15T13:45:30 -> den 15 juni 2009 13:45:30 (sv-SE)
  /// 2009-06-15T13:45:30 -> Δευτέρα, 15 Ιουνίου 2009 1:45:30 μμ (el-GR)
  fullDateTimeLongTime('F'),

  /// Universal full date/time pattern. (U)
  /// 009-06-15T13:45:30 -> Monday, June 15, 2009 8:45:30 PM (en-US)
  /// 2009-06-15T13:45:30 -> den 15 juni 2009 20:45:30 (sv-SE)
  /// 2009-06-15T13:45:30 -> Δευτέρα, 15 Ιουνίου 2009 8:45:30 μμ (el-GR)
  universalFullDateTime('U'),

  /// Universal sortable date/time pattern. (u)
  /// With a DateTimeOffset value: 2009-06-15T13:45:30 -> 2009-06-15 20:45:30Z
  universalSortableDateTime('u'),

  /// Long time pattern. (T)
  /// 2009-06-15T13:45:30 -> 1:45:30 PM (en-US)
  /// 2009-06-15T13:45:30 -> 13:45:30 (hr-HR)
  /// 2009-06-15T13:45:30 -> 01:45:30 م (ar-EG)
  longTime('T'),

  /// Short Time Pattern (t)
  /// 2009-06-15T13:45:30 -> 1:45 PM (en-US
  /// 2009-06-15T13:45:30 -> 13:45 (hr-HR)
  /// 2009-06-15T13:45:30 -> 01:45 م (ar-E`G)
  shortTime('t'),

  /// Sortable Date/Time (s)
  /// 2009-06-15T13:45:30 (DateTimeKind.Local) -> 2009-06-15T13:45:30
  sortableDateTime('s'),

  /// RFC1123 pattern. (R)
  /// DateTimeOffset input: 2009-06-15T13:45:30 -> Mon, 15 Jun 2009 20:45:30 GMT
  /// Same as [rfc1123lower]
  rfc1123('R'),

  /// RFC1123 pattern. (r)
  /// DateTimeOffset input: 2009-06-15T13:45:30 -> Mon, 15 Jun 2009 20:45:30 GMT
  /// Same as [rfc1123]
  rfc1123lower('r'),

  /// round-trip date/time pattern. (O)
  /// 2009-06-15T13:45:30-07:00 --> 2009-06-15T13:45:30.0000000-07:00
  /// Same as [roundTripDateTimelower]
  roundTripDateTime('O'),

  /// round-trip date/time pattern. (o)
  /// 2009-06-15T13:45:30-07:00 --> 2009-06-15T13:45:30.0000000-07:00
  /// Same as [roundTripDateTime]
  roundTripDateTimelower('o'),

  /// Month/day pattern. (M)
  /// 2009-06-15T13:45:30 -> June 15 (en-US)
  /// 2009-06-15T13:45:30 -> 15. juni (da-DK)
  /// 2009-06-15T13:45:30 -> 15 Juni (id-ID)
  /// Same as [monthDayLower]
  monthDay('M'),

  /// Month/day pattern. (m)
  /// 2009-06-15T13:45:30 -> June 15 (en-US)
  /// 2009-06-15T13:45:30 -> 15. juni (da-DK)
  /// 2009-06-15T13:45:30 -> 15 Juni (id-ID)
  /// Same as [monthDay]
  monthDaylower('m'),

  /// General date/time pattern (short time). (g)
  /// 2009-06-15T13:45:30 -> 6/15/2009 1:45 PM (en-US)
  /// 2009-06-15T13:45:30 -> 15/06/2009 13:45 (es-ES)
  /// 2009-06-15T13:45:30 -> 2009/6/15 13:45 (zh-CN)
  generalDateTimeShortTime('g'),

  /// General date/time pattern (long time). (G)
  /// 2009-06-15T13:45:30 -> 6/15/2009 1:45:30 PM (en-US)
  /// 2009-06-15T13:45:30 -> 15/06/2009 13:45:30 (es-ES)
  /// 2009-06-15T13:45:30 -> 2009/6/15 13:45:30 (zh-CN)
  generalDateTimeLongTime('G'),

  /// Year-Month pattern (Y)
  /// 2009-06-15T13:45:30 -> June 2009 (en-US)
  /// 2009-06-15T13:45:30 -> juni 2009 (da-DK)
  /// 2009-06-15T13:45:30 -> Juni 2009 (id-ID)
  /// Same as [yearMonthlower]
  yearMonth("Y"),

  /// Year-Month pattern (y)
  /// 2009-06-15T13:45:30 -> June 2009 (en-US)
  /// 2009-06-15T13:45:30 -> juni 2009 (da-DK)
  /// 2009-06-15T13:45:30 -> Juni 2009 (id-ID)
  /// Same as [yearMonth]
  yearMonthlower('y'),

  /// The time separator. (:)
  /// 2009-06-15T13:45:30 -> : (en-US)
  /// 2009-06-15T13:45:30 -> . (it-IT)
  /// 2009-06-15T13:45:30 -> : (ja-JP)
  timeSeparator(':'),

  /// The date separator. (/)
  /// 2009-06-15T13:45:30 -> / (en-US)
  /// 2009-06-15T13:45:30 -> - (ar-DZ)
  /// 2009-06-15T13:45:30 -> . (tr-TR)
  dateSeparator('/'),

  /// Defines the following character as a custom format specifier. (%)
  /// 2009-06-15T13:45:30 (%h) -> 1
  customFormat('%'),

  /// Literal string delimiter.
  /// 2009-06-15T13:45:30 ("arr:" h:m t) -> arr: 1:45 P
  /// 2009-06-15T13:45:30 ('arr:' h:m t) -> arr: 1:45 P
  stringLiteral('literal_string'),

  /// The escape character. (\)
  /// 2009-06-15T13:45:30 (h \h) -> 1 h
  escape(r'\'),

  /// The character is copied to the result string unchanged.
  /// 2009-06-15T01:45:30 (arr hh:mm t) -> arr 01:45 A
  other('other'),
  ;

  const DateTimeFormatTokenTypeDotNet(this.str);

  /// String representation of this token. This value can be used as an actual value for the parser.
  final String str;

  @override
  String toString() => name;
}

class DateFormatToken {
  final DateTimeFormatTokenTypeDotNet token;
  final String value;

  DateFormatToken(this.token, [String? value]) : value = value ?? token.str;

  @override
  String toString() => "[$token]=[$value]";
}
