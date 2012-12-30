# Monday, November 5, 2012

## 3:59 PM `getattr` vs `getattribute`

`__getattribute__()` is called unconditionally, `__getattr__()` is not called unless `__getattribute__()` calls it explicitly or raises an `AttributeError`. 

`__get__()` is called by `__getattribute` - I don't understand this.
