### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ 16d21fef-3bfe-4163-aac4-f9cb1c03acc8
using LinearAlgebra

# ╔═╡ 1bd060fa-ce09-11ee-3539-651cd7ebb757
Nl = [394, 461, 391, 334, 169, 113, 148]

# ╔═╡ dd8b59a2-5217-4f53-86fc-7c542c2825a6
μl = [5.4, 16.3, 24.3, 34.5, 42.1, 50.1, 63.8]

# ╔═╡ 39b6f80f-2b35-4716-a8b3-0bbe986d3d0d
σl = [8.3, 13.3, 15.1, 19.8, 24.5, 26, 35.2]

# ╔═╡ d11d6023-5a30-4282-a671-78691a2563c2
function optstratalloc(Nl, σl, n)
	L = length(Nl)
	N = sum(Nl)
	Wl = Nl / N
	n * (Wl .* σl) / (Wl ⋅ σl)
end

# ╔═╡ fe9c2d59-5b83-48d8-86f9-7943a50e1533
nopt = optstratalloc(Nl, σl, 100)

# ╔═╡ 7273342e-2a47-4903-afda-60901cbccd1f
function propalloc(Nl, n)
	N = sum(Nl)
	n * Nl / N
end

# ╔═╡ d96ec377-3fd9-4dce-a30f-4034a0806fd8
nprop = propalloc(Nl, 100)

# ╔═╡ 3e6c22f3-a1e0-4ca5-87ee-b09bc671edab
function varoptstratalloc(Nl, σl, n)
	N = sum(Nl)
	Wl = Nl / N
	(Wl ⋅ σl)^2 / n
end

# ╔═╡ 07bbe544-98bb-4e0a-92f7-13f66db13293
varopt = varoptstratalloc(Nl, σl, 100)

# ╔═╡ 9f44ace2-6332-4c53-9440-b85b886daede
function varpropalloc(Nl, σl, n)
	N = sum(Nl)
	Wl = Nl / N
	(Wl ⋅ σl.^2) / n
end

# ╔═╡ e6016807-4e22-4946-baa1-cd93b7904851
varprop = varpropalloc(Nl, σl, 100)

# ╔═╡ 84610815-6e4d-4d5f-8c85-6a91fd2c2081
function varsimple(Nl, σl, μl, n)
	N = sum(Nl)
	Wl = Nl / N
	μ = Wl ⋅ μl
	σ = √(Wl ⋅ σl.^2 + Wl ⋅ (μl .- μ).^2)
	σ^2 / n
end

# ╔═╡ 9f4c00ac-d5c9-405c-92f5-fefa5bfb3fac
varsim = varsimple(Nl, σl, μl, 100)

# ╔═╡ 5dcde80a-76cc-4044-baef-3bd351e94714
N = sum(Nl)

# ╔═╡ 0c3088d3-eb46-47ce-9173-5579b6912b02
Wl = Nl / N

# ╔═╡ 847b7b2c-f39f-48d2-bc92-7933d7f9009f
μ = Wl ⋅ μl

# ╔═╡ efefa5bb-1cee-4eda-ba59-181c9f1a67b9
popvar = (Wl ⋅ σl.^2 + Wl ⋅ (μl .- μ).^2)

# ╔═╡ d16d73d9-bf4c-4758-b1f6-74df239ecb5b
function var10(Nl, σl)
	N = sum(Nl)
	Wl = Nl / N
	nl = 10
	res = 0.0
	for l ∈ 1:length(Wl)
		res += Wl[l]^2*(1/nl)*σl[l]^2
	end
	res
end

# ╔═╡ fc0e4b34-923f-41e9-812f-f25a7442d70b
var10(Nl, σl)

# ╔═╡ 1a55c46b-d76a-494e-b4c4-3daa6ae58f9b
popvar / var10(Nl, σl)

# ╔═╡ 217ab9ea-bb9d-45aa-aee4-e33ef8046447
varpropalloc(Nl, σl, 70)

# ╔═╡ 19429559-e5f8-4eb9-bfa9-2f9be8feea43
popvar / varpropalloc(Nl, σl, 70)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.2"
manifest_format = "2.0"
project_hash = "ac1187e548c6ab173ac57d4e72da1620216bce54"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"
"""

# ╔═╡ Cell order:
# ╠═16d21fef-3bfe-4163-aac4-f9cb1c03acc8
# ╠═1bd060fa-ce09-11ee-3539-651cd7ebb757
# ╠═dd8b59a2-5217-4f53-86fc-7c542c2825a6
# ╠═39b6f80f-2b35-4716-a8b3-0bbe986d3d0d
# ╠═d11d6023-5a30-4282-a671-78691a2563c2
# ╠═fe9c2d59-5b83-48d8-86f9-7943a50e1533
# ╠═7273342e-2a47-4903-afda-60901cbccd1f
# ╠═d96ec377-3fd9-4dce-a30f-4034a0806fd8
# ╠═3e6c22f3-a1e0-4ca5-87ee-b09bc671edab
# ╠═07bbe544-98bb-4e0a-92f7-13f66db13293
# ╠═9f44ace2-6332-4c53-9440-b85b886daede
# ╠═e6016807-4e22-4946-baa1-cd93b7904851
# ╠═84610815-6e4d-4d5f-8c85-6a91fd2c2081
# ╠═9f4c00ac-d5c9-405c-92f5-fefa5bfb3fac
# ╠═5dcde80a-76cc-4044-baef-3bd351e94714
# ╠═0c3088d3-eb46-47ce-9173-5579b6912b02
# ╠═847b7b2c-f39f-48d2-bc92-7933d7f9009f
# ╠═efefa5bb-1cee-4eda-ba59-181c9f1a67b9
# ╠═d16d73d9-bf4c-4758-b1f6-74df239ecb5b
# ╠═fc0e4b34-923f-41e9-812f-f25a7442d70b
# ╠═1a55c46b-d76a-494e-b4c4-3daa6ae58f9b
# ╠═217ab9ea-bb9d-45aa-aee4-e33ef8046447
# ╠═19429559-e5f8-4eb9-bfa9-2f9be8feea43
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
