### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 1b117b7b-a83b-442b-a3d2-9e20957b7a15
Nl = [98, 98, 98, 99]

# ╔═╡ b917e566-15c4-4f85-8da5-d0771ec55fcf
σl = [103.4, 204.8, 243.5, 419.2]

# ╔═╡ 9d74b1bd-e16e-422f-93af-6cc1cbacb0a5
nl = [10, 10, 10, 10]

# ╔═╡ 577a4562-d070-11ee-1db4-ebe8f42c4b78
function stderr(Nl, nl, σl)
	L = length(Nl)
	err = 0
	Wl = Nl / sum(Nl)
	for l ∈ 1:L
		err += Wl[l]^2 * (1/nl[l]) * (1 - (nl[l] - 1)/(Nl[l] - 1)) * σl[l]^2
	end
	√(err)
end

# ╔═╡ 610aa677-8537-4c1f-b7c4-5af275a51733
stderr(Nl, nl, σl)

# ╔═╡ Cell order:
# ╠═1b117b7b-a83b-442b-a3d2-9e20957b7a15
# ╠═b917e566-15c4-4f85-8da5-d0771ec55fcf
# ╠═9d74b1bd-e16e-422f-93af-6cc1cbacb0a5
# ╠═577a4562-d070-11ee-1db4-ebe8f42c4b78
# ╠═610aa677-8537-4c1f-b7c4-5af275a51733
