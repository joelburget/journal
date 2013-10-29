# Thursday, September 19, 2013

## Visualization Driven Development

We tend to use log statements, maybe pretty printing. Data visualizations are
built into big applications.

Does *everyone* here use Clojure?

LOGO/Mindstorms. All about making something abstract and tangible something you
can understand.

[VDD Core](http://github.com/element84/vdd-core) - focused on Clojure, uses the
browser. Includes a built-in server, uses websockets.

D3 visualizations of tree. The animations are a bit gratuitous but it seems
useful. Works great for tiny data - the tree he showed had size ~10. How
well/gracefully does it scale?

You must still design the visualization and annotate code to capture vis data.

Jig analogy: A carpenter can cut one or two chairs by hand but it doesn't
scale. Create a jig and you can easily cut a bunch of pieces of wood. I guess
the jig is these tools, not sure how tight the analogy is.

## Elm

Text, Elements, Forms

> import Mouse
> import Keyboard
>
> words : Element
> words = [markdown|
> # Hello StrangeLoop
>
> Thanks for coming
> |]
>
> img = image 200 200 "/yogi.jpg"
>
> stack : Element
> stack = flow inword [ words, img ]
>
> shapes (x, y) = collage 200 200
>        [ rotate (degrees (toFloat x)) (filled blue (ngon 5 50))
>        , scale (toFloat y / 100) (outlined (dashed red) (circle 70))
>        -- , rotate (degrees 30) (scale 0.5 (toForm stack))
>        ]
>
> main = lift asText
>     (foldp (\dir (x, y) -> (x + dir.x, y + dir.y)) (0, 0) Keyboard.arrows)

> lift : (a -> b) -> Signal a -> Signal b
> foldp : (a -> b -> b) -> b -> Signal a -> Signal b
> x |> f = f x

## Clojure core.async

"Good programs should be made of processes and queues." Conveyance should be
first class.

Events/Callbacks - exposed as listenable futures or callbacks. Callback hell.

Hoare's CSP. First class channels are the only way independent processed
communicate. Blocking by default so they can be used for coordination.

Make timeouts channels. `(timeout msecs)` returns a channel that closes after
`msecs`.

Use with callbacks by taking from the queue.

"Friends don't let friends put logic in handlers"

"intimacy = pain, ignorance = bliss"

## Linear Logic Programming

linear logic + logic programming

Linear logic is good at modeling locally stateful computation. For instance in
a board game you may only care about the space the player is on and the
adjacent spaces.

persistent / truth-based logic:

    ((gravity => things fall) ^ gravity)
    => things fall ^ gravity

linear logic

    (($1 -o snack) <*> $1)
    -o snack

`A <*> B` - resource conjunction
`A -o B` - replace A with B
`!A` - refer to persistent fact A
`1` - nothing

Quiescence - analog of saturation?

Linear logic chooses to apply rules nondeterministically.
