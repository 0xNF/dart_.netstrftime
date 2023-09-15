import 'package:collection/collection.dart';
import 'package:dotnetstrftime/dotnetstrftime.dart';
import 'package:dotnetstrftime/src/utils.dart';
import 'package:intl/intl.dart' as intl;
import 'package:characters/characters.dart';
import 'package:intl/locale.dart';

List<DateFormatToken> _dateFormatStringParserCSharp(String formatString) {
  var lst = <DateFormatToken>[];
  final iter = formatString.characters.iterator;

  var isSingleton = formatString.runes.length == 1;

  if (isSingleton) {
    final chars = formatString.characters.firstOrNull;
    if (chars == DateTimeFormatTokenTypeDotNet.yearMonth.str ||
        chars == DateTimeFormatTokenTypeDotNet.yearMonthlower.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.yearMonth));
    } else if (chars ==
        DateTimeFormatTokenTypeDotNet.universalFullDateTime.str) {
      lst.add(
          DateFormatToken(DateTimeFormatTokenTypeDotNet.universalFullDateTime));
    } else if (chars ==
        DateTimeFormatTokenTypeDotNet.universalSortableDateTime.str) {
      lst.add(DateFormatToken(
          DateTimeFormatTokenTypeDotNet.universalSortableDateTime));
    } else if (chars == DateTimeFormatTokenTypeDotNet.longTime.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.longTime));
    } else if (chars == DateTimeFormatTokenTypeDotNet.shortTime.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.shortTime));
    } else if (chars == DateTimeFormatTokenTypeDotNet.sortableDateTime.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.sortableDateTime));
    } else if (chars == DateTimeFormatTokenTypeDotNet.rfc1123.str ||
        chars == DateTimeFormatTokenTypeDotNet.rfc1123lower.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.rfc1123));
    } else if (chars == DateTimeFormatTokenTypeDotNet.roundTripDateTime.str ||
        chars == DateTimeFormatTokenTypeDotNet.roundTripDateTimelower.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.roundTripDateTime));
    } else if (chars == DateTimeFormatTokenTypeDotNet.monthDay.str ||
        chars == DateTimeFormatTokenTypeDotNet.monthDaylower.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.monthDay));
    } else if (chars ==
        DateTimeFormatTokenTypeDotNet.generalDateTimeLongTime.str) {
      lst.add(DateFormatToken(
          DateTimeFormatTokenTypeDotNet.generalDateTimeLongTime));
    } else if (chars ==
        DateTimeFormatTokenTypeDotNet.generalDateTimeShortTime.str) {
      lst.add(DateFormatToken(
          DateTimeFormatTokenTypeDotNet.generalDateTimeShortTime));
    } else if (chars ==
        DateTimeFormatTokenTypeDotNet.fullDateTimeLongTime.str) {
      lst.add(
          DateFormatToken(DateTimeFormatTokenTypeDotNet.fullDateTimeLongTime));
    } else if (chars ==
        DateTimeFormatTokenTypeDotNet.fullDateTimeShortTime.str) {
      lst.add(
          DateFormatToken(DateTimeFormatTokenTypeDotNet.fullDateTimeShortTime));
    } else if (chars == DateTimeFormatTokenTypeDotNet.longDate.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.longDate));
    } else if (chars == DateTimeFormatTokenTypeDotNet.shortDate.str) {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.shortDate));
    } else {
      throw DateTimeFormatException(
          message:
              'Date/Time format string must either be a single character of the recognized set, or requires a minimum of 2+ characters. If formatting a singleton and the full date form is not desired, preface with "%"');
    }
    return lst;
  }

  while (iter.moveNext()) {
    final cur = iter.current;
    /* check  Year (y)*/
    if (cur == 'y') {
      /* check for double y */
      if (iter.charactersAfter.firstOrNull == 'y') {
        iter.moveNext();
        /* check for triple y */
        if (iter.charactersAfter.firstOrNull == 'y') {
          iter.moveNext();
          /* check for quad y */
          if (iter.charactersAfter.firstOrNull == 'y') {
            iter.moveNext();
            /* check for quint y */
            if (iter.charactersAfter.firstOrNull == 'y') {
              lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.yyyyy));
              iter.moveNext();
            } else {
              lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.yyyy));
            }
          } else {
            lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.yyy));
          }
        } else {
          lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.yy));
        }
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.y));
      }
    }
    /* check era (g) */
    else if (cur == 'g') {
      /* check for double g */
      if (iter.charactersAfter.firstOrNull == 'g') {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.gg));
        iter.moveNext();
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.g));
      }
    }
    /* check Month (M)*/
    else if (cur == 'M') {
      /* check for double M */
      if (iter.charactersAfter.firstOrNull == 'M') {
        iter.moveNext();
        /* check for triple M */
        if (iter.charactersAfter.firstOrNull == 'M') {
          iter.moveNext();
          /* check for quad M */
          if (iter.charactersAfter.firstOrNull == 'M') {
            iter.moveNext();
            lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.MMMM));
          } else {
            lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.MMM));
          }
        } else {
          lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.MM));
        }
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.M));
      }
    }
    /* check Day (d) */
    else if (cur == 'd') {
      /* check for double M */
      if (iter.charactersAfter.firstOrNull == 'd') {
        iter.moveNext();
        /* check for triple M */
        if (iter.charactersAfter.firstOrNull == 'd') {
          iter.moveNext();
          /* check for quad M */
          if (iter.charactersAfter.firstOrNull == 'd') {
            iter.moveNext();
            lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.dddd));
          } else {
            lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.ddd));
          }
        } else {
          lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.dd));
        }
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.d));
      }
    }
    /* check AM/PM */
    else if (cur == 't') {
      /* check for double t */
      if (iter.charactersAfter.firstOrNull == 't') {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.tt));
        iter.moveNext();
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.t));
      }
    }
    /* check 24-Hour (H) */
    else if (cur == 'H') {
      /* check for double t */
      if (iter.charactersAfter.firstOrNull == 'H') {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.HH));
        iter.moveNext();
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.H));
      }
    }
    /* check 12-Hour (h) */
    else if (cur == 'h') {
      /* check for double t */
      if (iter.charactersAfter.firstOrNull == 'h') {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.hh));
        iter.moveNext();
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.h));
      }
    }
    /* check minute (m) */
    else if (cur == 'm') {
      /* check for double m */
      if (iter.charactersAfter.firstOrNull == 'm') {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.mm));
        iter.moveNext();
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.m));
      }
    }
    /* check second (s) */
    else if (cur == 's') {
      /* check for double s */
      if (iter.charactersAfter.firstOrNull == 's') {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.ss));
        iter.moveNext();
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.s));
      }
    }
    /* check milliseconds (f)*/
    else if (cur == 'f') {
      /* check for double f */
      if (iter.charactersAfter.firstOrNull == 'f') {
        iter.moveNext();
        /* check for triple f */
        if (iter.charactersAfter.firstOrNull == 'f') {
          iter.moveNext();
          /* check for quad f */
          if (iter.charactersAfter.firstOrNull == 'f') {
            iter.moveNext();
            /* check for quint f */
            if (iter.charactersAfter.firstOrNull == 'f') {
              iter.moveNext();
              /* check for sext f */
              if (iter.charactersAfter.firstOrNull == 'f') {
                /* check for sept f */
                iter.moveNext();
                if (iter.charactersAfter.firstOrNull == 'f') {
                  lst.add(
                      DateFormatToken(DateTimeFormatTokenTypeDotNet.fffffff));
                  iter.moveNext();
                } else {
                  lst.add(
                      DateFormatToken(DateTimeFormatTokenTypeDotNet.ffffff));
                }
              } else {
                lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.fffff));
              }
            } else {
              lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.ffff));
            }
          } else {
            lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.fff));
          }
        } else {
          lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.ff));
        }
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.f));
      }
    }
    /* check milliseconds if not zero (F)*/
    else if (cur == 'F') {
      /* check for double f */
      if (iter.charactersAfter.firstOrNull == 'F') {
        iter.moveNext();
        /* check for triple f */
        if (iter.charactersAfter.firstOrNull == 'F') {
          iter.moveNext();
          /* check for quad f */
          if (iter.charactersAfter.firstOrNull == 'F') {
            iter.moveNext();
            /* check for quint f */
            if (iter.charactersAfter.firstOrNull == 'F') {
              iter.moveNext();
              /* check for sext f */
              if (iter.charactersAfter.firstOrNull == 'F') {
                /* check for sept f */
                iter.moveNext();
                if (iter.charactersAfter.firstOrNull == 'F') {
                  lst.add(
                      DateFormatToken(DateTimeFormatTokenTypeDotNet.FFFFFFF));
                  iter.moveNext();
                } else {
                  lst.add(
                      DateFormatToken(DateTimeFormatTokenTypeDotNet.FFFFFF));
                }
              } else {
                lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.FFFFF));
              }
            } else {
              lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.FFFF));
            }
          } else {
            lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.FFF));
          }
        } else {
          lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.FF));
        }
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.F));
      }
    }
    /* check Timezone Offset (z) */
    else if (cur == 'z') {
      /* check for double z */
      if (iter.charactersAfter.firstOrNull == 'z') {
        iter.moveNext();
        /* check for triple z */
        if (iter.charactersAfter.firstOrNull == 'z') {
          lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.zzz));
          iter.moveNext();
        } else {
          lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.zz));
        }
      } else {
        lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.z));
      }
    }
    /* check Timezone info */
    else if (cur == 'K') {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.K));
    }
    /* check Tiem Separatoe */
    else if (cur == ':') {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.timeSeparator));
    }
    /* check Date Separator */
    else if (cur == '/') {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.dateSeparator));
    }
    /* check escape */
    else if (cur == r'\') {
      if (iter.moveNext()) {
        lst.add(
            DateFormatToken(DateTimeFormatTokenTypeDotNet.other, iter.current));
      }
    }
    /* check literal string */
    else if (cur == '"') {
      final literalBuilder = StringBuffer();
      while (iter.moveNext()) {
        if (iter.current == '"') {
          break;
        } else if (iter.current == r'\') {
          literalBuilder.write(iter.charactersAfter.firstOrNull ?? '');
          iter.moveNext();
        } else {
          literalBuilder.write(iter.currentCharacters);
        }
      }
      if (iter.current != '"') {
        throw DateTimeFormatException(
            message:
                'Cannot parse time format string: missing closing quote character');
      }
      lst.add(DateFormatToken(
          DateTimeFormatTokenTypeDotNet.other, literalBuilder.toString()));
    }
    /* check next defined as Custom Specifier */
    else if (cur == '%') {
      /* nop */
    }
    /* Add all other literals */
    else {
      lst.add(DateFormatToken(DateTimeFormatTokenTypeDotNet.other, cur));
    }
  }
  return lst;
}

/// Adds convenience formatting methods on DateTime objects, allowing for `.formatAsDotNET()` etc
extension TimeFormating on DateTime {
  /// See also - https://learn.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings
  String formatAsDotNET(String formatString, [Locale? locale]) {
    var l = locale?.toString() ?? intl.Intl.getCurrentLocale();
    final tokens = _dateFormatStringParserCSharp(formatString);
    final sb = <String>[];
    final iter = tokens.iterator;
    while (iter.moveNext()) {
      final t = iter.current;
      switch (t.token) {
        case DateTimeFormatTokenTypeDotNet.d:
          sb.add("$day");
        case DateTimeFormatTokenTypeDotNet.dd:
          sb.add(zeroPadLeft(day));
        case DateTimeFormatTokenTypeDotNet.ddd:
          final s = intl.DateFormat('EEE', l).format(this);
          sb.add(s);
        case DateTimeFormatTokenTypeDotNet.dddd:
          final s = intl.DateFormat('EEEE', l).format(this);
          sb.add(s);
        case DateTimeFormatTokenTypeDotNet.f:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          sb.add(zeroPadRight(s, 1)[0]);
        case DateTimeFormatTokenTypeDotNet.ff:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          sb.add(zeroPadRight(s).substring(0, 2));
        case DateTimeFormatTokenTypeDotNet.fff:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          sb.add(zeroPadRight(s, 3).substring(0, 3));
        case DateTimeFormatTokenTypeDotNet.ffff:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          sb.add(zeroPadRight(s, 4).substring(0, 4));
        case DateTimeFormatTokenTypeDotNet.fffff:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          sb.add(zeroPadRight(s, 5).substring(0, 5));
        case DateTimeFormatTokenTypeDotNet.ffffff:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          sb.add(zeroPadRight(s, 6).substring(0, 6));
        case DateTimeFormatTokenTypeDotNet.fffffff:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          sb.add(zeroPadRight(s, 7).substring(0, 7));
        case DateTimeFormatTokenTypeDotNet.F:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          final padded = zeroPadRight(s, 1)[0];
          if (padded.isNotEmpty &&
              padded
                  .split('')
                  .whereNot((element) => element == '0')
                  .isNotEmpty) {
            sb.add(padded);
          } else if (sb.isNotEmpty && sb.last == '.') {
            sb.removeLast();
          }
        case DateTimeFormatTokenTypeDotNet.FF:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          final padded = zeroPadRight(s).substring(0, 2);
          if (padded.isNotEmpty &&
              padded
                  .split('')
                  .whereNot((element) => element == '0')
                  .isNotEmpty) {
            sb.add(padded);
          } else if (sb.isNotEmpty && sb.last == '.') {
            sb.removeLast();
          }
        case DateTimeFormatTokenTypeDotNet.FFF:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          final padded = zeroPadRight(s, 3).substring(0, 3);
          if (padded.isNotEmpty &&
              padded
                  .split('')
                  .whereNot((element) => element == '0')
                  .isNotEmpty) {
            sb.add(padded);
          } else if (sb.isNotEmpty && sb.last == '.') {
            sb.removeLast();
          }
        case DateTimeFormatTokenTypeDotNet.FFFF:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          final padded = zeroPadRight(s, 4).substring(0, 4);
          if (padded.isNotEmpty &&
              padded
                  .split('')
                  .whereNot((element) => element == '0')
                  .isNotEmpty) {
            sb.add(padded);
          } else if (sb.isNotEmpty && sb.last == '.') {
            sb.removeLast();
          }
        case DateTimeFormatTokenTypeDotNet.FFFFF:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          final padded = zeroPadRight(s, 5).substring(0, 5);
          if (padded.isNotEmpty &&
              padded
                  .split('')
                  .whereNot((element) => element == '0')
                  .isNotEmpty) {
            sb.add(padded);
          } else if (sb.isNotEmpty && sb.last == '.') {
            sb.removeLast();
          }
        case DateTimeFormatTokenTypeDotNet.FFFFFF:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          final padded = zeroPadRight(s, 6).substring(0, 6);
          if (padded.isNotEmpty &&
              padded
                  .split('')
                  .whereNot((element) => element == '0')
                  .isNotEmpty) {
            sb.add(padded);
          } else if (sb.isNotEmpty && sb.last == '.') {
            sb.removeLast();
          }
        case DateTimeFormatTokenTypeDotNet.FFFFFFF:
          final s =
              "${zeroPadRight(millisecond, 3)}${zeroPadRight(microsecond, 4)}";
          final padded = zeroPadRight(s, 7).substring(0, 7);
          if (padded.isNotEmpty &&
              padded
                  .split('')
                  .whereNot((element) => element == '0')
                  .isNotEmpty) {
            sb.add(padded);
          } else if (sb.isNotEmpty && sb.last == '.') {
            sb.removeLast();
          }
        case DateTimeFormatTokenTypeDotNet.g:
        case DateTimeFormatTokenTypeDotNet.gg:
          final s = intl.DateFormat('G', l).format(this);
          sb.add(s);
        case DateTimeFormatTokenTypeDotNet.h:
          sb.add("${hour % 12}");
        case DateTimeFormatTokenTypeDotNet.hh:
          sb.add(zeroPadLeft(hour % 12));
        case DateTimeFormatTokenTypeDotNet.H:
          sb.add("$hour");
        case DateTimeFormatTokenTypeDotNet.HH:
          sb.add(zeroPadLeft(hour));
        case DateTimeFormatTokenTypeDotNet.K:
          if (isUtc) {
            sb.add("Z");
          } else {
            if (timeZoneOffset.inHours == 0 && timeZoneOffset.inMinutes == 0) {
              /* unspecified is no-print */
            } else {
              /* otherwise write it as a normal +/- timezone */
              final hours = timeZoneOffset.inHours;
              final minutes = timeZoneOffset.inMinutes % 60;
              sb.add(
                  "${timeZoneOffset.isNegative ? '-' : '+'}${zeroPadLeft(hours)}:${zeroPadLeft(minutes)}");
            }
          }
        case DateTimeFormatTokenTypeDotNet.m:
          sb.add("$minute");
        case DateTimeFormatTokenTypeDotNet.mm:
          sb.add(zeroPadLeft(minute));
        case DateTimeFormatTokenTypeDotNet.M:
          sb.add("$month");
        case DateTimeFormatTokenTypeDotNet.MM:
          sb.add(zeroPadLeft(month));
        case DateTimeFormatTokenTypeDotNet.MMM:
          final s = intl.DateFormat('MMM', l).format(this);
          sb.add(s);
        case DateTimeFormatTokenTypeDotNet.MMMM:
          final s = intl.DateFormat('MMMM', l).format(this);
          sb.add(s);
        case DateTimeFormatTokenTypeDotNet.s:
          sb.add("$second");
        case DateTimeFormatTokenTypeDotNet.ss:
          sb.add(zeroPadLeft(second));
        case DateTimeFormatTokenTypeDotNet.t:
          final s = intl.DateFormat('a', l).format(this);
          sb.add(s.characters.first);
        case DateTimeFormatTokenTypeDotNet.tt:
          final s = intl.DateFormat('a', l).format(this);
          sb.add(s);
        case DateTimeFormatTokenTypeDotNet.y:
          sb.add("${year % 100}");
        case DateTimeFormatTokenTypeDotNet.yy:
          sb.add(zeroPadLeft(year % 100));
        case DateTimeFormatTokenTypeDotNet.yyy:
          sb.add(zeroPadLeft(year, 3));
        case DateTimeFormatTokenTypeDotNet.yyyy:
          sb.add(zeroPadLeft(year, 4));
        case DateTimeFormatTokenTypeDotNet.yyyyy:
          sb.add(zeroPadLeft(year, 5));
        case DateTimeFormatTokenTypeDotNet.z:
          final hours = timeZoneOffset.inHours;
          sb.add("${timeZoneOffset.isNegative ? '-' : '+'}$hours");
        case DateTimeFormatTokenTypeDotNet.zz:
          final hours = timeZoneOffset.inHours;
          sb.add(
              "${timeZoneOffset.isNegative ? '-' : '+'}${zeroPadLeft(hours)}");
        case DateTimeFormatTokenTypeDotNet.zzz:
          final hours = timeZoneOffset.inHours;
          final minutes = timeZoneOffset.inMinutes % 60;
          sb.add(
              "${timeZoneOffset.isNegative ? '-' : '+'}${zeroPadLeft(hours)}:${zeroPadLeft(minutes)}");
        case DateTimeFormatTokenTypeDotNet.timeSeparator:
          final s = intl.DateFormat('Hm', l).format(this);
          sb.add(s[2]);
        case DateTimeFormatTokenTypeDotNet.dateSeparator:
          final s = intl.DateFormat('yMd', l).format(this);
          if (s[0] == "0" || (s[0] == "1" && (int.tryParse(s[1]) != null))) {
            sb.add(s[2]);
          } else {
            sb.add(s[1]);
          }
        case DateTimeFormatTokenTypeDotNet.other:
          sb.add(t.value);
        case DateTimeFormatTokenTypeDotNet.shortDate:
          sb.add(intl.DateFormat.yMd(l).format(this));
        case DateTimeFormatTokenTypeDotNet.longDate:
          sb.add(intl.DateFormat.yMMMMEEEEd(l).format(this));
        case DateTimeFormatTokenTypeDotNet.fullDateTimeShortTime:
          final hfmt = l == 'en_US'
              ? intl.DateFormat.HOUR_MINUTE
              : intl.DateFormat.HOUR24_MINUTE;
          sb.add(intl.DateFormat.yMMMMEEEEd(l).addPattern(hfmt).format(this));
        case DateTimeFormatTokenTypeDotNet.fullDateTimeLongTime:
          final hfmt = l == 'en_US'
              ? intl.DateFormat.HOUR_MINUTE_SECOND
              : intl.DateFormat.HOUR24_MINUTE_SECOND;
          sb.add(intl.DateFormat.yMMMMEEEEd(l).addPattern(hfmt).format(this));
        case DateTimeFormatTokenTypeDotNet.universalFullDateTime:
          // FYI(nf, 05/09/23): as as 'F', with automatic conversion to utc
          final asUTC = toUtc();
          sb.add(asUTC.formatAsDotNET('F', locale));
        case DateTimeFormatTokenTypeDotNet.universalSortableDateTime:
          // FYI(nf, 05/09/23): this specifier mandates that the datetime is in utc,
          // and that the locale is ignored
          final asUTC = toUtc();
          sb.add(asUTC.formatAsDotNET("yyyy-MM-dd HH:mm:ssZ",
              Locale.fromSubtags(languageCode: 'en', countryCode: 'US')));
        case DateTimeFormatTokenTypeDotNet.longTime:
          final hfmt = l == 'en_US'
              ? intl.DateFormat.HOUR_MINUTE_SECOND
              : intl.DateFormat.HOUR24_MINUTE_SECOND;
          sb.add(intl.DateFormat(hfmt, l).format(this));
        case DateTimeFormatTokenTypeDotNet.shortTime:
          final hfmt = l == 'en_US'
              ? intl.DateFormat.HOUR_MINUTE
              : intl.DateFormat.HOUR24_MINUTE;
          sb.add(intl.DateFormat(hfmt, l).format(this));
        case DateTimeFormatTokenTypeDotNet.sortableDateTime:
          // FYI(nf, 05/09/23): this specifier mandates that the locale is ignored
          sb.add(formatAsDotNET("yyyy-MM-ddTHH:mm:ss",
              Locale.fromSubtags(languageCode: 'en', countryCode: 'US')));
        case DateTimeFormatTokenTypeDotNet.rfc1123:
        case DateTimeFormatTokenTypeDotNet.rfc1123lower:
          // FYI(nf, 05/09/23): this specifier mandates that the datetime is in utc,
          // and that the locale is ignored
          final asUTC = toUtc();
          sb.add(asUTC.formatAsDotNET("ddd, dd MMM yyyy HH:mm:ss \"GMT\"",
              Locale.fromSubtags(languageCode: 'en', countryCode: 'US')));
        case DateTimeFormatTokenTypeDotNet.roundTripDateTime:
        case DateTimeFormatTokenTypeDotNet.roundTripDateTimelower:
          sb.add(formatAsDotNET("yyyy-MM-ddTHH:mm:ss.fffffffK", locale));
        case DateTimeFormatTokenTypeDotNet.monthDay:
        case DateTimeFormatTokenTypeDotNet.monthDaylower:
          sb.add(intl.DateFormat.MMMMd(l).format(this));
        case DateTimeFormatTokenTypeDotNet.generalDateTimeShortTime:
          final hfmt = l == 'en_US'
              ? intl.DateFormat.HOUR_MINUTE
              : intl.DateFormat.HOUR24_MINUTE;
          sb.add(intl.DateFormat.yMd(l).addPattern(hfmt).format(this));
        case DateTimeFormatTokenTypeDotNet.generalDateTimeLongTime:
          final hfmt = l == 'en_US'
              ? intl.DateFormat.HOUR_MINUTE_SECOND
              : intl.DateFormat.HOUR24_MINUTE_SECOND;
          sb.add(intl.DateFormat.yMd(l).addPattern(hfmt).format(this));
        case DateTimeFormatTokenTypeDotNet.yearMonth:
        case DateTimeFormatTokenTypeDotNet.yearMonthlower:
          sb.add(intl.DateFormat.yMMMM(l).format(this));
        case DateTimeFormatTokenTypeDotNet.customFormat:
        case DateTimeFormatTokenTypeDotNet.stringLiteral:
        case DateTimeFormatTokenTypeDotNet.escape:
          throw DateTimeFormatException(
              message:
                  'An internal parser error occured. The \'${t.token.name}\' token type should never appear in the formatting switch');
      }
    }
    for (int i = 0; i < sb.length; i++) {
      String part = sb[i];
      part = part.replaceAll(spaceRegex, ' ');
      sb[i] = part;
    }
    return sb.join();
  }
}
