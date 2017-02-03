# MathTicks

[![Build Status](https://travis-ci.org/skleinbo/MathTicks.jl.svg?branch=master)](https://travis-ci.org/skleinbo/MathTicks.jl)

[![Coverage Status](https://coveralls.io/repos/skleinbo/MathTicks.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/skleinbo/MathTicks.jl?branch=master)

[![codecov.io](http://codecov.io/github/skleinbo/MathTicks.jl/coverage.svg?branch=master)](http://codecov.io/github/skleinbo/MathTicks.jl?branch=master)

* Enable LaTeX rendering with Plots.jl using the PyPlot backend. 
* Wrap tick labels in LaTeX math mode to use the math font.

## Installation
`Pkg.clone("https://github.com/skleinbo/MathTicks.jl.git")`

## Usage
```
using Plots
pyplot()

import MathTicks

p = plot(fakedata(100));

# Enable typesetting with LaTeX. Default TeX engine is XeLaTeX.
MathTicks.toggleTeX()

# Set preamble to load a math-font package
MathTicks.rcParams["text.latex.preamble"] = ["\\usepackage[euler-digits]{eulervm}"]

# Convert ticks
MathTicks.ticksAsMath!(p)

display(p)
```