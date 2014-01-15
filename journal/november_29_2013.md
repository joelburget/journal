# Friday, November 29, 2013

## Confusing SDL Types

`SDL_Window` - This is straightforward - represents a window on screen.
`SDL_Renderer` - A 2d rendering context for a window. Maybe you need one of these per window? Options - software or accelerated, etc.
`SDL_Surface` - "A collection of pixels used in software blitting"
`SDL_Texture` - "A structure that contains an efficient, driver-specific representation of pixel data."

> SDL_Texture objects are stored as close as possible to Video Card Memory and
> therefore can easily be accelerated by your video card. Resizing, alpha
> blending, anti-aliasing and almost any compute-heavy operation can harshly be
> affected by this performance boost. If your program needs to run a per-pixel
> logic on your textures, you are encouraged to convert your textures into
> surfaces temporarily. Achieving a workaround with streaming textures is also
> possible.

> Through creating a SDL2 Texture as a STREAMING type, one can lock and unlock
> the entire texture or just an area of pixels to perform direct pixel
> operations.

So it seems the difference is that textures are stored in video memory and
surfaces are available for pixel-by-pixel manipulation.

http://stackoverflow.com/a/13569077

`SDL_RenderCopy` - copy a portion of a texture to a renderer. Use this to compose the final framebuffer.
