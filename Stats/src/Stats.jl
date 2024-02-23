module Stats

using Distributions
using StatsPlots

export confint
export plotdiscreteestimate

function confint(μ::Float64, σ::Float64, conflevel::Float64)::Tuple{Float64, Float64}
    alpha = 1 - conflevel
    Z = quantile(Normal(), 1 - alpha/2)
    errormarg = Z * σ
    lower = μ - errormarg
    upper = μ + errormarg
    return (lower, upper)	
end

function plotdiscreteestimate(data::Vector{Int64}, dist::T, xlabel::String) where T<:DiscreteUnivariateDistribution
	xrange = minimum(data):maximum(data)
	pmf = pdf.(dist, xrange)
	observed = [count(==(i), data) for i in minimum(data):maximum(data)]
	observed = observed / sum(observed)
	y = hcat(observed, pmf)
	xcat = string.(xrange)
	groupedbar(xcat, y, bar_position=:dodge, bar_width=0.7, labels=["Observed" "Estimated"], ylabel="Frequency", xlabel=xlabel)
end

end # module Stats
