# Simulations

Simulation submodule.

## Functions

Bioequivalence power simulation

bePower(;alpha, logscale, theta1, theta2, theta0, cv, n, simnum, seed)

Proportion power simulation

ctPropPower(p1, n1, p2, n2, ref; alpha, type, citype, method, simnum, seed)

Proportion simulation sample size

ctPropSampleN(p1, p2, ref; alpha, beta, type, citype, method, simnum, seed)

### <a name="bePower">bePower</a>

```
bePower(;alpha=0.05, logscale=true, theta1=0.8, theta2=1.25, theta0=0.95, cv=0.0, n=0, simnum=5, seed=0)
```

### <a name="ctPropPower">ctPropPower</a>

```
ctPropPower(p1, n1, p2, n2, diff; alpha=0.05, type=:or, method=:mn, seed=0, simnum=5)
```

### <a name="ctPropSampleN">ctPropSampleN</a>

```
ctPropSampleN(p1, p2, ref; alpha=0.05, beta=0.2, type=:notdef, citype =:notdef, method=:notdef, simnum=5, seed=0)
```

### <a name="ctMeansPower">ctMeansPower</a>

```
ctMeansPower(m1, s1, n1, m2, s2, n2, ref; alpha=0.05, method=:notdef, simnum=5, seed=0)
```

### <a name="ctMeansPowerFS">ctMeansPowerFS</a>

```
ctMeansPowerFS(m1, s1, n1, m2, s2, n2, ref;alpha=0.05, method=:notdef, simnum::Real=5, seed=0)
```
