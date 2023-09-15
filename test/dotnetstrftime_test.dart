import 'package:dotnetstrftime/dotnetstrftime.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/locale.dart';
import 'package:test/test.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  /// January 2nd, 0008 T 03:04:05.6789123456
  /// n.b. this gets transformed to a weird +45m timezone
  var dtAM = DateTime(008, 1, 2, 3, 4, 5, 6, 7).toUtc();

  /// January 2nd, 0008 T 23:55:55.55789123456
  var dtPM = DateTime(008, 1, 2, 23, 5, 55, 55, 7);

  /// January 1st, -0005 T 01:01:01.011
  var dtBC = DateTime(-5, 1, 1, 1, 1, 1, 1);

  /// May 8th, 2023 T 2:42:33.2332
  var dtAD = DateTime(2023, 05, 08, 14, 42, 33, 345);

  /// May 8th, 2023 T 2:42:33.2332
  var dtWithEmptyMilliseconds = DateTime(2023, 05, 08, 14, 42, 50, 000, 678);

  final ja = Locale.fromSubtags(languageCode: 'ja', countryCode: 'JP');
  final it = Locale.fromSubtags(languageCode: 'it', countryCode: 'IT');
  group("Date Time Formatting Tests", () {
    setUp(() async {
      await initializeDateFormatting();
      tz.initializeTimeZones();
      final loc =
          tz.getLocation('Australia/Eucla'); // Because is weird and has 8:45
      dtAM = tz.TZDateTime.from(dtAM, loc);
      dtPM = tz.TZDateTime.utc(dtAM.year, dtAM.month, dtAM.day, 23, dtAM.minute,
          dtAM.second, dtAM.millisecond, dtAM.microsecond);
    });

    /// This is a test of the underlying `intl` library
    test('check parsing of locales into BCP47', () {
      // FYI(nf, 05/10/23): underlying intl library will use capital G to get the era
      // We hand in the Locale(ja, JP) to test if it can correctly retrieve `ja` from the locale
      // and return the right localized era string
      final dt = DateFormat('G', ja.toString()).format(dtWithEmptyMilliseconds);
      expect(dt, "西暦");
    });

    group("test standard time formatting", () {
      // TODO(nf, 05/08/23): add the custom time formatters
      test("test Short Date Pattern (d)", () {
        expect(dtWithEmptyMilliseconds.formatAsDotNET("d"), "5/8/2023");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("d", ja), "2023/5/8");
      });
      test("test Long Date Pattern (D)", () {
        expect(
            dtWithEmptyMilliseconds.formatAsDotNET("D"), "Monday, May 8, 2023");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("D", ja), "2023年5月8日月曜日");
      });
      test("Test Full DateTime Pattern (Short Time) (f)", () {
        // 2009-06-15T13:45:30 -> Monday, June 15, 2009 1:45 PM (en-US)
        expect(dtWithEmptyMilliseconds.formatAsDotNET("f"),
            "Monday, May 8, 2023 2:42 PM");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("f", ja),
            "2023年5月8日月曜日 14:42");
      });
      test("test Full DateTime Pattern (Long Time) (F)", () {
        // 2009-06-15T13:45:30 -> Monday, June 15, 2009 1:45:30 PM (en-US)
        expect(dtWithEmptyMilliseconds.formatAsDotNET("F"),
            "Monday, May 8, 2023 2:42:50 PM");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("F", ja),
            "2023年5月8日月曜日 14:42:50");
      });
      test("test General Date Time Pattern (Short Time) (g)", () {
        // 2009-06-15T13:45:30 -> 6/15/2009 1:45 PM (en-US)
        expect(dtWithEmptyMilliseconds.formatAsDotNET("g"), "5/8/2023 2:42 PM");
        expect(
            dtWithEmptyMilliseconds.formatAsDotNET("g", ja), "2023/5/8 14:42");
      });
      test("test General Date Time Pattern (Long Time) (G)", () {
        // 2009-06-15T13:45:30 -> 6/15/2009 1:45:30 PM (en-US)
        expect(
            dtWithEmptyMilliseconds.formatAsDotNET("G"), "5/8/2023 2:42:50 PM");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("G", ja),
            "2023/5/8 14:42:50");
      });

      test("test MonthDay Pattern (M, m)", () {
        // 2009-06-15T13:45:30 -> June 15 (en-US)
        expect(dtWithEmptyMilliseconds.formatAsDotNET("M"), "May 8");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("m"), "May 8");

        expect(dtWithEmptyMilliseconds.formatAsDotNET("M", ja), "5月8日");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("m", ja), "5月8日");
      });
      test("test RoundTrip DateTime (O, o)", () {
        // 2009-06-15T13:45:30-07:00 --> 2009-06-15T13:45:30.0000000-07:00
        // 2009-06-15T13:45:30 (DateTimeKind.Utc) --> 2009-06-15T13:45:30.0000000Z
        expect(dtWithEmptyMilliseconds.formatAsDotNET("O"),
            "2023-05-08T14:42:50.0006780+09:00");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("o"),
            "2023-05-08T14:42:50.0006780+09:00");

        expect(dtWithEmptyMilliseconds.formatAsDotNET("O", ja),
            "2023-05-08T14:42:50.0006780+09:00");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("o", ja),
            "2023-05-08T14:42:50.0006780+09:00");
      });

      test("test RFC1123 (R, r)", () {
        expect(dtWithEmptyMilliseconds.formatAsDotNET("R"),
            "Mon, 08 May 2023 05:42:50 GMT");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("r"),
            "Mon, 08 May 2023 05:42:50 GMT");

        expect(dtWithEmptyMilliseconds.formatAsDotNET("R", ja),
            "Mon, 08 May 2023 05:42:50 GMT");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("r", ja),
            "Mon, 08 May 2023 05:42:50 GMT");
      });
      test("test Sortable DateTime Pattern (s)", () {
        expect(
            dtWithEmptyMilliseconds.formatAsDotNET("s"), "2023-05-08T14:42:50");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("s", ja),
            "2023-05-08T14:42:50");
      });
      test("test Short Time Pattern (t)", () {
        expect(dtWithEmptyMilliseconds.formatAsDotNET("t"), "2:42 PM");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("t", ja), "14:42");
      });
      test("test Long Time Pattern (T)", () {
        expect(dtWithEmptyMilliseconds.formatAsDotNET("T"), "2:42:50 PM");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("T", ja), "14:42:50");
      });
      test("test Universal Sortable DateTime pattern (u)", () {
        expect(dtWithEmptyMilliseconds.formatAsDotNET("u"),
            "2023-05-08 05:42:50Z");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("u", ja),
            "2023-05-08 05:42:50Z");
      });

      test("test Universal Full DateTime pattern (U)", () {
        expect(dtWithEmptyMilliseconds.formatAsDotNET("U"),
            "Monday, May 8, 2023 5:42:50 AM");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("U", ja),
            "2023年5月8日月曜日 5:42:50");
      });
      test("test YearMonth pattern (y, Y)", () {
        expect(dtWithEmptyMilliseconds.formatAsDotNET("y"), "May 2023");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("Y"), "May 2023");

        expect(dtWithEmptyMilliseconds.formatAsDotNET("y", ja), "2023年5月");
        expect(dtWithEmptyMilliseconds.formatAsDotNET("Y", ja), "2023年5月");
      });
    });

    group("test custom time formatting", () {
      group("test Z's", () {
        test("Test zzz", () {
          expect(dtAM.formatAsDotNET('zzz'), '+08:45');
        });

        test("Test zz", () {
          expect(dtAM.formatAsDotNET('zz'), '+08');
        });

        test("Test z", () {
          expect(dtAM.formatAsDotNET('%z'), '+8');
        });
      });

      group("test Misc", () {
        test("Test :", () {
          expect(dtAM.formatAsDotNET('%:'), ':');
          // TODO(nf, 05/08/23): `it` should really return '.'`
          expect(dtAM.formatAsDotNET('%:', it), ':');
        });

        test("Test /", () {
          expect(dtAM.formatAsDotNET('%/'), '/');
          // TODO(nf, 05/08/23): `it` should really return '.'`
          expect(dtAM.formatAsDotNET('%/', it), '/');
        });

        test("Test throws for too few characters in invalid sequence", () {
          expect(() => dtAM.formatAsDotNET('q'),
              throwsA(isA<DateTimeFormatException>()));
        });
      });

      group("test Year", () {
        test("Test yyyyy", () {
          expect(dtAM.formatAsDotNET('yyyyy'), '00008');
        });

        test("Test yyyy", () {
          expect(dtAM.formatAsDotNET('yyyy'), '0008');
        });

        test("Test yyy", () {
          expect(dtAM.formatAsDotNET('yyy'), '008');
        });

        test("Test yy", () {
          expect(dtAM.formatAsDotNET('yy'), '08');
        });

        test("Test y", () {
          expect(dtAM.formatAsDotNET('%y'), '8');
        });

        test("Test y with extra", () {
          expect(dtAM.formatAsDotNET('q %y'), 'q 8');
        });
      });

      group("test gs", () {
        test('Test g and gg', () {
          expect(dtBC.formatAsDotNET('%g'), 'BC');
          expect(dtAD.formatAsDotNET('%g'), 'AD');
        });

        test("test gg", () {
          expect(dtBC.formatAsDotNET('gg', ja), '紀元前');
          expect(dtAD.formatAsDotNET('gg', ja), '西暦');
        });
      });

      group("test Month", () {
        test("Test MMMM", () {
          expect(dtAM.formatAsDotNET('MMMM'), 'January');
          expect(dtAM.formatAsDotNET('MMMM', ja), '1月');
        });

        test("Test MMM", () {
          expect(dtAM.formatAsDotNET('MMM'), 'Jan');
          expect(dtAM.formatAsDotNET('MMMM', ja), '1月');
        });

        test("Test MM", () {
          expect(dtAM.formatAsDotNET('MM'), '01');
        });

        test("Test M", () {
          expect(dtAM.formatAsDotNET('%M'), '1');
        });
      });

      group("test days", () {
        test("Test dddd", () {
          expect(dtAM.formatAsDotNET('dddd'), 'Wednesday');
          expect(dtAM.formatAsDotNET('dddd', ja), '水曜日');
        });

        test("Test ddd", () {
          expect(dtAM.formatAsDotNET('ddd'), 'Wed');
          expect(dtAM.formatAsDotNET('ddd', ja), '水');
        });

        test("Test dd", () {
          expect(dtAM.formatAsDotNET('dd'), '02');
        });

        test("Test d", () {
          expect(dtAM.formatAsDotNET('%d'), '2');
        });
      });

      group("test Hour", () {
        test("Test HH", () {
          expect(dtPM.formatAsDotNET('HH'), '23');
        });

        test("Test H", () {
          expect(dtPM.formatAsDotNET('%H'), '23');
        });

        test("Test hh", () {
          expect(dtPM.formatAsDotNET('hh'), '11');
        });

        test("Test h", () {
          expect(dtPM.formatAsDotNET('%h'), '11');
        });
      });

      group("test minute", () {
        test("Test mm", () {
          expect(dtBC.formatAsDotNET('mm'), '01');
        });

        test("Test m", () {
          expect(dtBC.formatAsDotNET('%m'), '1');
        });
      });

      group("test seconds", () {
        test("Test ss", () {
          expect(dtAM.formatAsDotNET('ss'), '05');
        });

        test("Test s", () {
          expect(dtAM.formatAsDotNET('%s'), '5');
        });
      });

      group("test milliseconds with zero", () {
        test("Test fffffff", () {
          expect(dtAD.formatAsDotNET('fffffff'), '3450000');
        });
        test("Test ffffff", () {
          expect(dtAD.formatAsDotNET('ffffff'), '345000');
        });
        test("Test fffff", () {
          expect(dtAD.formatAsDotNET('fffff'), '34500');
        });
        test("Test ffff", () {
          expect(dtAD.formatAsDotNET('ffff'), '3450');
        });

        test("Test fff", () {
          expect(dtAD.formatAsDotNET('fff'), '345');
        });

        test("Test ff", () {
          expect(dtAD.formatAsDotNET('ff'), '34');
        });

        test("Test f", () {
          expect(dtAD.formatAsDotNET('%f'), '3');
        });
      });

      group("test milliseconds not zero", () {
        test("Test FFFFFFF", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET('FFFFFFF'), '0006780');
        });
        test("Test FFFFFF", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET('FFFFFF'), '000678');
        });
        test("Test FFFFF", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET('FFFFF'), '00067');
        });
        test("Test FFFF", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET('FFFF'), '0006');
        });

        test("Test FFF", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET('FFF'), '');
        });

        test("Test FF", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET('FF'), '');
        });

        test("Test F", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET('%F'), '');
        });
      });

      group("test AM/PM", () {
        test("Test tt", () {
          expect(dtAM.formatAsDotNET('tt'), 'AM');
          expect(dtPM.formatAsDotNET('tt'), 'PM');
          expect(dtAM.formatAsDotNET('tt', ja), '午前');
          expect(dtPM.formatAsDotNET('tt', ja), '午後');
        });

        test("Test t", () {
          expect(dtAM.formatAsDotNET('%t'), 'A');
          expect(dtPM.formatAsDotNET('%t'), 'P');
          expect(dtAM.formatAsDotNET('%t', ja), '後');
          expect(dtPM.formatAsDotNET('%t', ja), '前');
        });
      });

      group('test Timezone Info', () {
        test("test K", () {
          expect(dtAM.formatAsDotNET('%K'), '+08:45');
          expect(dtAM.toUtc().formatAsDotNET('%K'), 'Z');
        });
      });

      // todo do custom format

      group("test string literals", () {
        test("literals", () {
          expect(dtAM.formatAsDotNET('"pst"'), "pst");
          expect(dtAM.formatAsDotNET(r'"with \"internal\" quoted string"'),
              'with "internal" quoted string');
          expect(dtAM.formatAsDotNET(r'"with \"incomplete quoted string"'),
              'with "incomplete quoted string');
        });

        test("throw if no closing quote", () {
          expect(() => dtAM.formatAsDotNET('"pst'),
              throwsA(isA<DateTimeFormatException>()));
        });
      });

      group("test escape", () {
        test("escape", () {
          expect(dtAM.formatAsDotNET(r'\d'), "d");
          expect(dtAM.formatAsDotNET(r'\y\y\y\y'), "yyyy");
        });
      });

      group("test complex", () {
        test("just date 01", () {
          expect(dtAM.formatAsDotNET(r"dd\/MM\/yy"), "02/01/08");
          expect(dtAM.formatAsDotNET("dd-MM-yy"), "02-01-08");
          expect(dtAM.formatAsDotNET(r"d\/M\/yy"), "2/1/08");
        });

        test("just time 01", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET(r"hh\:mm\:ss"),
              "02:42:50");
          expect(dtWithEmptyMilliseconds.formatAsDotNET(r"h\:m\:s"), "2:42:50");
        });

        test("time with milliseconds", () {
          expect(dtWithEmptyMilliseconds.formatAsDotNET(r"hh\:mm\:ss.ffffff"),
              "02:42:50.000678");
          expect(dtWithEmptyMilliseconds.formatAsDotNET(r"h\:m\:s.FFF"),
              "2:42:50");
        });
      });
    });
  });
}
