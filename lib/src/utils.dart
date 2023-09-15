/// Stringifies an object and left-pads it with 0's
/// Used for making two-digit timestamp components
String zeroPadLeft(Object o, [int padLen = 2, String padChar = '0']) =>
    o.toString().padLeft(padLen, padChar);

/// Stringifies an object and right-pads it with 0's
/// Used for making two-digit timestamp components
String zeroPadRight(Object o, [int padLen = 2, String padChar = '0']) =>
    o.toString().padRight(padLen, padChar);

/// List of space characters that may appear in a string, useful for normalizing into regular ascii space (20)
const List<String> spaceCharacters = [
  /// space
  '\u0020',

  /// no-break space
  '\u00A0',

  /// Ogham space mark
  '\u1680',

  /// Mongolian vowel separator
  '\u180E',

  /// en quad
  '\u2000',

  /// em quad
  '\u2001',

  /// en space (nut)
  '\u2002',

  /// em space (mutton)
  '\u2003',

  /// three-per-em space (thick space)
  '\u2004',

  /// four-per-em space (mid space)
  '\u2005',

  /// six-per-em space
  '\u2006',

  /// figure space
  '\u2007',

  /// punctuation space
  '\u2008',

  /// thin space
  '\u2009',

  /// hair space
  '\u200A',

  /// zero width space
  '\u200B',

  /// narrow no-break space
  '\u202F',

  /// medium mathematical space
  '\u205F',

  /// ideographic space
  '\u3000',

  /// zero width no-break space
  '\uFEFF',
];

/// RegExp for finding all space chracters as defined by [spaceCharacters]
final RegExp spaceRegex = RegExp('[${spaceCharacters.join()}]');
