### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 829153e6-d041-11ee-3249-23e093bd9bf7
H = 100000

# ╔═╡ 0a92d582-19c3-4e14-9311-04a3cb8f370f
L = 500000

# ╔═╡ fa007405-48b1-4673-95b1-dd0605f2a1f9
σH = 20

# ╔═╡ 77f64861-6a87-4730-98ad-f1b8d29f53fb
σL = 12

# ╔═╡ 512a5b3f-057b-4952-b920-f2610d989b26
n = 100

# ╔═╡ f094cd12-8a78-4d43-9b10-4cb4c0cfb98d
function optalloc(H, L, σH, σL, n)
	N = H + L
	WH = H / N
	WL = L / N
	nH = n * WH * σH / (WH * σH + WL * σL)
	nL = n * WL * σL / (WH * σH + WL * σL)
	(nH, nL)
end

# ╔═╡ aff4b9be-3489-476a-b7bf-0ccf01e1fc61
optalloc(H, L, σH, σL, n)

# ╔═╡ a1d38990-d853-496d-8706-00e55ce8f490
function optdiffalloc(H, L, σH, σL, n)
	nH = n / (1 + σH / σL)
	nL = n / (1 + σL / σH)
	(nH, nL)
end

# ╔═╡ c638ad21-d984-4320-9bd0-e01ce07d7c5d
optdiffalloc(H, L, σH, σL, n)

# ╔═╡ 8bda88c7-6730-49d2-a7a2-bdfaba2ee6db
function optdiffalloc2(H, L, σH, σL, n)
	nH = n / (1 + σH / σL * √((H - n)/(L - n)*(L-1)/(H-1)))
	nL = n / (1 + σL / σH * √((L - n)/(H - n)*(H-1)/(L-1)))
	(nH, nL)
end

# ╔═╡ 9bc0739f-047f-4d30-bf8c-a10da4f20a9d
optdiffalloc2(H, L, σH, σL, n)

# ╔═╡ Cell order:
# ╠═829153e6-d041-11ee-3249-23e093bd9bf7
# ╠═0a92d582-19c3-4e14-9311-04a3cb8f370f
# ╠═fa007405-48b1-4673-95b1-dd0605f2a1f9
# ╠═77f64861-6a87-4730-98ad-f1b8d29f53fb
# ╠═512a5b3f-057b-4952-b920-f2610d989b26
# ╠═f094cd12-8a78-4d43-9b10-4cb4c0cfb98d
# ╠═aff4b9be-3489-476a-b7bf-0ccf01e1fc61
# ╠═a1d38990-d853-496d-8706-00e55ce8f490
# ╠═c638ad21-d984-4320-9bd0-e01ce07d7c5d
# ╠═8bda88c7-6730-49d2-a7a2-bdfaba2ee6db
# ╠═9bc0739f-047f-4d30-bf8c-a10da4f20a9d
