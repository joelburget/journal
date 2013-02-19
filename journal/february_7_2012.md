# Thursday, February 7, 2013

## 10:21 - git add patch mode

`git add -p` - only stage some hunks from changed files.

The trickiest part is editing a patch. You need to change the patch context
numbers at the top after you're done editing the patch so it will apply
cleanly. Seems like a really bad design choice to me but I'm sure there's a
reason.

http://johnkary.net/blog/git-add-p-the-most-powerful-git-feature-youre-not-using-yet/

## 3:39 PM - get and put model as dict

    from google.appengine.api import datastore
    from google.appengine.api import datastore_errors

    def get_entities(keys):
        rpc = datastore.GetRpcFromKwargs({})
        keys, multiple = datastore.NormalizeAndTypeCheckKeys(keys)
        entities = None
        try:
            entities = datastore.Get(keys, rpc=rpc)
        except datastore_errors.EntityNotFoundError:
            assert not multiple
        return entities

    def put_entities(entities):
        rpc = datastore.GetRpcFromKwargs({})
        keys = datastore.Put(entities, rpc=rpc)
        return keys
