# Friday, February 8, 2013

## 3:05 PM - Mercurial Phases

Mercurial has the concept of phases:

       | immutable | shared |
       +-----------+--------+
public | x         | x      |
draft  |           | x      |
secret |           |        |

secret -> draft -> public

## 3:10 PM - Immutable -> Mutable

Finally figured out how to make an immutable changeset mutable again

    hg phase --force --draft scratchpadmoderation

## 5:01 PM - unmtl

Lambdabot has a cool `unmtl` command

    ski: @unmtl StateT sigma (ContT omega (ReaderT rho m)) a
    lambdabot: sigma -> (a -> sigma -> rho -> m omega) -> rho -> m omega

    ski: @unmtl ContT omega (ReaderT rho m) a
    lambdabot: (a -> rho -> m omega) -> rho -> m omega
