# Thursday, December 6, 2012

## 11:16 AM - String Formatting

Conversions
-----------

'd': Signed integer decimal.
'i': Signed integer decimal.
'o': Signed octal value.
'u': Obsolete type – it is identical to 'd'.
'x': Signed hexadecimal (lowercase).
'X': Signed hexadecimal (uppercase).
'e': Floating point exponential format (lowercase).
'E': Floating point exponential format (uppercase).
'f': Floating point decimal format.
'F': Floating point decimal format.
'g': Floating point format. Uses lowercase exponential format if exponent is
less than -4 or not less than precision, decimal format otherwise.
'G': Floating point format. Uses uppercase exponential format if exponent is
less than -4 or not less than precision, decimal format otherwise.
'c': Single character (accepts integer or single character string).
'r': String (converts any Python object using repr()).
's': String (converts any Python object using str()).
'%': No argument is converted, results in a '%' character in the result.

Flags
-----

'#': The value conversion will use the “alternate form” (where defined below).
'0': The conversion will be zero padded for numeric values.
'-': The converted value is left adjusted (overrides the '0' conversion if both
are given).
' ': (a space) A blank should be left before a positive number (or empty
string) produced by a signed conversion.
'+': A sign character ('+' or '-') will precede the conversion (overrides a
“space” flag).

## 11:28 AM - `repr` vs `str`

`repr`
------

> Return the canonical string representation of the object. For most object
> types, eval(repr(object)) == object.

`str`
-----

> Return a nice string representation of the object. If the argument is a
> string, the return value is the same object.
