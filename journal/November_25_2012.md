# Sunday, November 25, 2012

## 11:21 AM - [Python magic
methods](http://www.rafekettler.com/magicmethods.html)

## 1:40 PM - [Alan Kay's Reading
List](http://www.squeakland.org/resources/books/readingList.jsp)

## 2:26 PM - `Endo`

    newtype Endo a = Endo (a -> a)

    -- Endo . f - make a monoid of a function f :: a -> b -> b
    -- Endo . f :: a -> Endo b
    instance Monoid (Endo a) where
    mempty = id
    mappend = (.)
