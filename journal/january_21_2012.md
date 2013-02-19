# Monday, January 21, 2012

## 2:24 PM - Clearing Up Python Iteration Terms

* iterable: an object capable of returning its members one at a time. Defined
  with `__iter__` or `__getitem__`.
  - `__iter__` returns an iterator
* generator: A function which returns an iterator. Looks like a normal function
  except it contains `yield` statements.
* iterator: represents a stream of data
  - `next` returns the next value in the stream
  - `StopIteration` exception indicates no more data

So both iterable and generator return an iterator.

## 9:58 PM - OpenGL Coordinate Systems

### Object Space

The local coordinate system of the objects in the scene.

### World Space

The space where everything is positioned. Every vertex in an object is
multiplied by the *world matrix* (*model matrix*) to be transformed to world
space.

### Camera (Eye) Space

Multiply every vertex in world space with the *view matrix* to transform it to
camera space.

The *modelview matrix* is model and view composed.

### Projection (Clip) Space

Orthographic or perspective projection from 3d to 2d. Multiply vertices by the
*projection matrix* to transform from camera to projection space.

### Normalized Device Coordinates

Divide the clip space by `w`, called *perspective division* to get coordinates
normalized to [-1, 1] in all three axes.

### Window / Screen Coordinates

NDC's are scaled and translated to fit the screen.

### ModelView Matrix

  x  y  z   translation
| m0 m4 m8  m12 |
| m1 m5 m9  m13 |
| m2 m6 m10 m14 |
| m3 m7 m11 m15 |

m15 is the homogeneous coordinate, `w`.

(m0, m1, m2): +x axis, left
(m4, m5, m6): +y axis, up
(m8, m9, m10): +z axis, forward

## 10:30 PM - [Great Site for OpenGL](http://www.songho.ca/opengl/index.html)
