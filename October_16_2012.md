# Tuesday, October 16, 2012

## 12:32 PM - datastore

"The Datastore will never assign the same numeric ID to two entities with the
same parent, or to two root entities (those without a parent)." I guess it will
assign the same ID in other cases?

## 1:50 - datastore, continued

*entity group* - an entity and its descendents.
*ancestor path* - sequence of entities beginning with the root entity,
proceeding from parent to child, leading to a given entity

... And the payoff -

> A single transaction can apply to multiple entities, so long as the entities
> are descended from a common ancestor. Such entities are said to belong to the
> same entity group. In designing your data model, you should determine which
> entities you need to be able to process in the same transaction. Then, when
> you create those entities, place them in the same entity group by declaring
> them with a common ancestor. This tells App Engine that the entities will be
> updated together, so it can store them in a way that supports transactions.

And

> To obtain strongly consistent query results, you need to use an ancestor
> query limiting the results to a single entity group. This works because
> entity groups are a unit of consistency as well as transactionality. All data
> operations are applied to the entire group; an ancestor query won't return
> its results until the entire entity group is up to date.

Gotcha "... limits changes to the guestbook to no more than 1 write per second
(the supported limit for entity groups)"

## 2:18 PM

`allocate_ids` - Allocates a range of key IDs for this model class.

Why?

## 2:38 PM
`classmethod` and `staticmethod` are not the same...
`staticmethod` knows nothing about the class it was called on.

## 2:53 PM
Oh my god, "The identifier may be either a key name string, assigned explicitly
by the application when the instance is created, or an integer numeric ID,
assigned automatically by App Engine when the instance is written (put) to the
Datastore." So you can use whatever the hell you want as a key identifier. How
have I never known this?

`id` - Returns the numeric ID of the data entity, as an integer, or `None` if
the entity does not have a numeric ID.

`id_or_name` - Returns the name or numeric ID of the data entity, whichever it
has, or None if the entity has neither a name nor a numeric ID.

`name` - Returns the name of the data entity, or `None` if the entity does not
have a name.
