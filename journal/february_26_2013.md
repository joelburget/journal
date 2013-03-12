# Tuesday, February 26, 2013

## 7:43 AM - `bimap`, `either`

    -- map over each side
    class BiFunctor f where
        bimap :: (a -> b) -> (c -> d) -> f a c -> f b d

    instance BiFunctor Either where
        bimap f g (Left x) = Left (f x)
        bimap f g (Right x’) = Right (g x’)

    -- get value from either side
    either :: (a -> c) -> (b -> c) -> Either a b -> c
    either f g (Left x) = f x
    either f g (Right y) = g y

## 11:37 AM - Web Workers

http://ejohn.org/blog/web-workers/

Allow you to run js in parallel without blocking UI.

    // Load worker.js and execute it in the background
    new Worker("worker.js");

1. No access to the DOM. Can use `setTimeout`, `setInterval`, and
   `XMLHttpRequest`.
2. No access to the parent page.

Page:

    var worker = new Worker("worker.js");

    // Watch for messages from the worker
    worker.onmessage = function(e){
      // The message from the client:
      e.data
    };

    worker.postMessage("start");

Worker:

    onmessage = function(e){
      if ( e.data === "start" ) {
        // Do some computation
        done();
      }
    };

    function done(){
      // Send back the results to the parent page
      postMessage("done");
    }

## 9:32 PM

http://www.reddit.com/r/Khan/comments/1499u0/im_currently_tutoring_an_11_year_old_to_program/

* document functions/lack of namespaces better
* don't ignore silent errors http://www.khanacademy.org/cs/silent-error/1195853656
* better find!

## 9:36 PM

GHC can recover erased types from constructors!

* `a :: T1`, `b :: T2`
* `p :: UnknownTest`
* `t :: T1` or `t :: T2` depending on the case

    fun1 :: T1 -> IO ()
    fun1 (T1 i) = putStrLn $ "T1 " ++ show i

    fun2 :: T2 -> IO ()
    fun2 (T2 d) = putStrLn $ "T2 " ++ show d

    data UnknownTest where
        UnknownTest :: Test t -> UnknownTest

    prob :: T1 -> T2 -> UnknownTest
    prob x y = undefined

    main :: IO ()
    main = do
        let a = T1 5
            b = T2 10.0
            p = prob a b

        case p of
            UnknownTest t@(T1 _) -> fun1 t
            UnknownTest t@(T2 _) -> fun2 t
