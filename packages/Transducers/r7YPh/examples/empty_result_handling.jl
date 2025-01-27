# # Empty result handling
#
# Transducible processes [`foldl`](@ref) and [`mapfoldl`](@ref) try to
# do the right thing even when `init` is not given, _if_ the given
# binary operation `step` is supported by
# [InitialValues.jl](https://tkf.github.io/InitialValues.jl/dev/)
# (for example, `+`, `*`, `&`, and `|` are supported).  However, those
# functions _throw_ an exception if the given collection is empty or
# filtered out by the transducers:

using Test                                                             #src

using Transducers

add1(x) = x + 1

err = try                                                            # hide
foldl(*, Map(add1), [])
catch err; err; end                                                  # hide
@test err isa Transducers.EmptyResultError                           #src
#md showerror(stdout, err)                                           # hide

# To write robust code, it is recommended to use `init` if there is a
# reasonable default.  However, it may be useful to postpone
# "materializing" the result.  In such case, `Init` from InitialValues.jl
# can be used as a placeholder.

using InitialValues

result = foldl(*, Map(add1), [], init=Init)
nothing                                                              # hide

# `init=Init` is a short-hand notation of `init=Init(*)` (so that `*` does
# not have to be repeated):

@assert result === foldl(*, Map(add1), [], init=Init(*))

# Note also that [`transduce`](@ref) can be used for passing `init` as
# a positional argument:

@assert result === transduce(Map(add1), Completing(*), Init, [])

# Since the input collection `[]` is empty, `result` is `Init(*)` (which
# is an `InitialValues.InitialValue`):

using InitialValues: InitialValue
@assert result::InitialValue === Init(*)

# `Init(*)` is the left identity of `*`.  Multiplying it with any `x`
# from right returns `x` as-is.  This property may be useful, e.g., if
# `result` is known to be a scalar that is multiplied by a matrix just
# after the `foldl`:

@test ones(2, 2) ==                                                    #src
result * ones(2, 2)

# The identities `Init(*)` and `Init(+)` can be `convert`ed to numbers:

@test 1 ===                                                            #src
convert(Int, Init(*))

# `Init(*)` can also be `convert`ed to a `String`:

@test "" ===                                                           #src
convert(String, Init(*))

# This means that no special code is required if the result is going
# to be stored into, e.g., an `Array` or a `struct`:

@test begin                                                            #src
xs = [true, true]
xs[1] = Init(+)
xs
end == [false, true]                                                   #src

# They can be converted into numbers also by using `Integer`:

@test 0 ===                                                            #src
Integer(Init(+))

# or `float`:

@test 1.0 ===                                                          #src
float(Init(*))
#-
