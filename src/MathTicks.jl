## Drop in LaTeX mode.
## Default TeX engine is XeLaTeX
## Load font package

## Typeset tick labels in math font by escaping them in math mode $...$
## Either use a formatter, e.g
## or convert ticks using

module MathTicks

export ticksAsMath!, labelsAsMath!, toggleTeX, preamble

import Plots
import PyPlot
import PyCall

try
    global rcParams = PyCall.PyDict(PyPlot.matplotlib["rcParams"]);
catch
    error("Error importing rcParams from matplotlib. Check your PyCall and PyPlot!")
end

global preamble = MathTicks.rcParams["text.latex.preamble"]

function toggleTeX(;rcParams=MathTicks.rcParams)
    rcParams["text.usetex"] ⊻= true
end


function ticksAsMath!(A::Plots.Axis)
    values,labels = Plots.get_ticks(A)
    A[:ticks] = (values, map(x->"\$$x\$", labels))
end

function ticksAsMath!(P::Plots.Plot{Plots.PyPlotBackend})
    for p in P.subplots
        ticksAsMath!(Plots.get_axis(p,:x))
        ticksAsMath!(Plots.get_axis(p,:y))
        try
            ticksAsMath!(Plots.get_axis(p,:z))
        catch
        end
    end
end

function labelsAsMath!(P::Plots.Plot{Plots.PyPlotBackend})
    for p in P.subplots
        for s in p.series_list
            s[:label] = "\$$(s[:label])\$"
        end
    end
end

end
