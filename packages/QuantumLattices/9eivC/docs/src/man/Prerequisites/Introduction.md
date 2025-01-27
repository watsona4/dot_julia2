```@meta
CurrentModule=QuantumLattices.Prerequisites
```

# Introduction

This module contains the prerequisites of the QuantumLattices package.

The constants, types, macros, functions or submodules defined in this module will **NOT** be exported by the package. Instead, they serve as the prerequisites and fundamentals.
The range of the contents are quite wide, but basically, they fall into 2 categories:
* Global constants and miscellaneous tiny useful functions;
* Basic data structures as supplements to the Julia.Base and other common packages.
The first category is contained in the main body of this module, while the other comes in separate submodules.

## Constants and functions

All the following constants and functions in this section are defined in the main body and are exported by this module.

```@docs
atol
rtol
Float
decimaltostr
ordinal
delta
```

## Basic structures

Here lists the table of contents of the basic data structures that are supplements to the Julia.Base and other common packages:
```@contents
Pages=[
    "TypeTraits.md",
    "Factories.md",
    "CompositeStructures.md",
    "Trees.md",
    "NamedVectors.md",
    ]
Depth=2
```
