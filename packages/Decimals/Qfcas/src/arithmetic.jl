Base.promote_rule(::Type{Decimal}, ::Type{<:Real}) = Decimal

# override definitions in Base
Base.promote_rule(::Type{BigFloat}, ::Type{Decimal}) = Decimal
Base.promote_rule(::Type{BigInt}, ::Type{Decimal}) = Decimal

# Addition
# To add, convert both decimals to the same exponent.
# (If the exponents are different, use the smaller exponent
# to make sure we're adding integers.)
function +(x::Decimal, y::Decimal)
    cx = (-1)^x.s * x.c * 10^max(x.q - y.q, 0)
    cy = (-1)^y.s * y.c * 10^max(y.q - x.q, 0)
    s = (abs(cx) > abs(cy)) ? x.s : y.s
    c = BigInt(cx) + BigInt(cy)
    normalize(Decimal(s, abs(c), min(x.q, y.q)))
end

# Negation
-(x::Decimal) = Decimal((x.s == 1) ? 0 : 1, x.c, x.q)

# Subtraction
-(x::Decimal, y::Decimal) = +(x, -y)

# Multiplication
function *(x::Decimal, y::Decimal)
    s = (x.s == y.s) ? 0 : 1
    normalize(Decimal(s, BigInt(x.c) * BigInt(y.c), x.q + y.q))
end

# Inversion
function Base.inv(x::Decimal)
    str = string(x)
    if str[1] == '-'
        str = str[2:end]
    end
    b = ('.' in str) ? length(split(str, '.')[1]) : 0
    c = round(BigInt(10)^(-x.q + DIGITS) / x.c)
    q = (x.q < 0) ? 1 - b - DIGITS : -b - DIGITS
    normalize(Decimal(x.s, c, q))
end

# Division
/(x::Decimal, y::Decimal) = x * inv(y)

# TODO exponentiation
