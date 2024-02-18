module Stats

using Distributions

export confint

function confint(μ::Float64, σ::Float64, conflevel::Float64)::Tuple{Float64, Float64}
    alpha = 1 - conflevel
    Z = quantile(Normal(), 1 - alpha/2)
    errormarg = Z * σ
    lower = μ - errormarg
    upper = μ + errormarg
    return (lower, upper)	
end

end # module Stats
