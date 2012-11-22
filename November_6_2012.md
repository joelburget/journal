# Tuesday, November 6, 2012

## 9:03 AM - static magic

`__getattr__` doesn't work for static methods, only for instance methods. To do
the same kind of magic for static variables [you need to use a
metaclass](http://stackoverflow.com/questions/3155436/getattr-for-static-class-variables-in-python).

Unfortunately metaclasses don't seem to be composable (but they are confusing).

## 10:32 AM - stuck alt key

Symptoms - characters appear in Greek, clicking between windows hides the
previous one.

Open up System Preferences > Language & Text, click Show Input menu in menu
bar, select Show Keyboard Viewer from menu bar, confirm key is stuck. Either
press both of the key if there are two of them or unplug the keyboard.
