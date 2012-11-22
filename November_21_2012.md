# Wednesday, November 21, 2012

## 11:36 AM - back references

This is wacky - 

> When a model has a ReferenceProperty to another model, each referenced entity
> gets a property whose value is a Query that returns all of the entities of
> the first model that refer to it.

    # To fetch and iterate over every SecondModel entity that refers to the
    # FirstModel instance obj1:
    for obj in obj1.secondmodel_set:
        # ...

Keep in mind, `FirstModel` has no property `secondmodel_set`.

> The name of the back-reference property defaults to modelname_set (with the
> name of the model class in lowercase letters, and "_set" added to the end),
> and can be adjusted using the collection_name argument to the
> ReferenceProperty constructor.
