# Friday, November 2, 2012

## 11:14 AM - more App Engine internals

A `Timeout`, `TransactionFailedError`, or `InternalError` may still be thrown
if a transaction has been committed and will eventually be applied
successfully. Make transactions idempotent!

Datastore write
---------------

protobuffed -> rpc'ed -> id generated if necessary -> commit -> apply

Commit
------

1. Data for entities written to the entity group's log
2. New log entry marked as committed

Apply
-----

The entity's data and index rows are written in parallel.

An entity's key is the row name and its data is a single column as a protocol
buffer.

Single properties are indexed by default, but `Text` is not, properties can be
marked as unindexed.

HRD returns after the commit and does apply asynchronously.

Failure
-------

A write operation can partially write (!) with some indexes and entities not
updated. I guess that's not big deal (?) because the datastore will roll
forward to apply the changes in two cases:

1. The next read, write, o transaction on the entity group.
2. "The datastore continuously sweeps for partially applied jobs" ... and rolls
   them forward.

> There is an expected failure rate on writes, because Bigtable tablets are
> sometimes unavailable, for example when they are being moved or split.

More indexes increases the chance of failure, the application should handle the
exception.

## 1:58 PM - Distributed Transactions

[Distributed Transactions for Google App Engine: Optimistic Distributed
Transactions built upon Local Multi-Version Concurrency
Control](http://arxiv.org/html/1106.3325v1)

Edit (November 26) - The implementation is in Java only -
[tapioca-orm](http://code.google.com/p/tapioca-orm/)
