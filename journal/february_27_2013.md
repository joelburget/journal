# February 27, 2013

## 3:11 PM - Python Exceptions

`except ValueError, e` is the old syntax. Now you're supposed to use `except
ValuError as e`. The syntax was backported from 3.0 to 2.6. In 2.x you need to
do `except (ValueError, os.error)` to disambiguate. In 3.x you need to use a
tuple to list the exceptions and an optional `as name`.

http://www.python.org/dev/peps/pep-3110/
