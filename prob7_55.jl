### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ a9da4932-cf86-11ee-3615-2d207f57bcc4
function stratapopstderr(Nl::Vector{Int64}, nl::Vector{Int64}, σl::Vector{Float64})::Float64
	N = sum(Nl)
	Wl = Nl ./ N
	√sum(Wl.^2 .* σl.^2 ./ nl)
end

# ╔═╡ 47cb72f2-881c-4dd6-a8dd-b159d4facc97
Nl = [100000, 500000]

# ╔═╡ a3e2d217-5bb7-4a79-b7be-9dc17203f9a8
nl = [100, 200]

# ╔═╡ 0e152841-2ef2-4f55-9ee8-46e9916f305f
σl = [20.0, 10.0]

# ╔═╡ 089e1052-5ada-4a5b-9225-7951d0313244
stratapopstderr(Nl, nl, σl)

# ╔═╡ 26362873-e2cb-43e0-b130-c9166f6f62b1
stratapopstderr(Nl, reverse(nl), σl)

# ╔═╡ 609e801c-6f16-42b1-867f-f4f0c5584683
function proportionalalloc(Nl::Vector{Int64}, n::Int64)::Vector{Int64}
	N = sum(Nl)
	Wl = Nl ./ N
	map(x -> Int64(round(x)), Wl .* n)
end

# ╔═╡ 07345852-5216-4a48-9e49-ebc9d2f4fb12
stratapopstderr(Nl, proportionalalloc(Nl, sum(nl)), σl)

# ╔═╡ Cell order:
# ╠═a9da4932-cf86-11ee-3615-2d207f57bcc4
# ╠═47cb72f2-881c-4dd6-a8dd-b159d4facc97
# ╠═a3e2d217-5bb7-4a79-b7be-9dc17203f9a8
# ╠═0e152841-2ef2-4f55-9ee8-46e9916f305f
# ╠═089e1052-5ada-4a5b-9225-7951d0313244
# ╠═26362873-e2cb-43e0-b130-c9166f6f62b1
# ╠═609e801c-6f16-42b1-867f-f4f0c5584683
# ╠═07345852-5216-4a48-9e49-ebc9d2f4fb12
