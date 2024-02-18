### A Pluto.jl notebook ###
# v0.19.36

using Markdown
using InteractiveUtils

# ╔═╡ d2bc0659-5527-46ad-a1e8-4fa8d124952e
using Pkg

# ╔═╡ 6e60c508-e694-4557-9db2-e413fa462747
Pkg.activate()

# ╔═╡ 2984dd99-8fe1-48fa-b785-f04484331648
Pkg.develop(path=pwd() * "/Stats")

# ╔═╡ 6894f18d-d99e-46aa-9aec-f5c7609ea629
using Statistics

# ╔═╡ 16a36360-aa91-4c16-b769-3941103107f7
using Stats

# ╔═╡ 19052332-cdba-11ee-0f2d-fdc10d234b39
data = [94 99 106 106 101 102 122 104 97 97
183 183 179 211 178 179 192 192 201 177
343 302 286 317 289 284 357 288 314 276] * 1.0

# ╔═╡ 4e57a8eb-f34c-49c7-9e24-c9d00fcd3b36
N1 = 1000

# ╔═╡ 289272f4-9ce8-44bc-8dfd-224ae38f07fd
N2 = 1000

# ╔═╡ 44829ff3-9e94-4ba9-a54c-d1368cc6baf1
N3 = 500

# ╔═╡ 90e921d7-8df9-4334-a522-47dcd0b4c955
N = N1 + N2 + N3

# ╔═╡ 0cdfd33f-8fc6-46cd-bc23-f69261902efb
function stratamean(sample, sizes)
	N = sum(sizes)
	total = 0.0
	for i ∈ 1:size(sample)[1]
		total += sizes[i] * mean(sample[i, :]) / N
	end
	total
end

# ╔═╡ 1e9e13fe-d085-479d-809a-0d723fc35db6
Xs = stratamean(data, [N1, N2, N3])

# ╔═╡ 38ccb853-6c7b-41c1-85ba-dff06bdeb743
function stratavar(sample, sizes)
	N = sum(sizes)
	total = 0.0
	for l ∈ 1:size(sample)[1]
		Nl = sizes[l]
		Wl = Nl / N
		nl = length(sample[l, :])
		sl = std(sample[l, :])
		total += Wl^2 * (1 / nl)*(1 - (nl - 1)/(Nl - 1))*sl^2
	end
	total
end

# ╔═╡ 3325728a-148c-451a-b331-a32a60bd0f0f
ss = stratavar(data, [N1, N2, N3])

# ╔═╡ 4eb0ff46-160f-4b65-8e45-c343624ef0dd
confint(Xs, ss, 0.9)

# ╔═╡ 5379c833-488f-4abc-87b2-64042b71dd0b
X = mean(data)

# ╔═╡ 5af65afe-a5c3-437f-8c74-1ff270e98e47
s = std(data)

# ╔═╡ 72b67ea3-3073-4501-bc31-0fad01d6ca13
confint(X, s, 0.9)

# ╔═╡ Cell order:
# ╠═d2bc0659-5527-46ad-a1e8-4fa8d124952e
# ╠═6e60c508-e694-4557-9db2-e413fa462747
# ╠═6894f18d-d99e-46aa-9aec-f5c7609ea629
# ╠═2984dd99-8fe1-48fa-b785-f04484331648
# ╠═16a36360-aa91-4c16-b769-3941103107f7
# ╠═19052332-cdba-11ee-0f2d-fdc10d234b39
# ╠═4e57a8eb-f34c-49c7-9e24-c9d00fcd3b36
# ╠═289272f4-9ce8-44bc-8dfd-224ae38f07fd
# ╠═44829ff3-9e94-4ba9-a54c-d1368cc6baf1
# ╠═90e921d7-8df9-4334-a522-47dcd0b4c955
# ╠═0cdfd33f-8fc6-46cd-bc23-f69261902efb
# ╠═1e9e13fe-d085-479d-809a-0d723fc35db6
# ╠═38ccb853-6c7b-41c1-85ba-dff06bdeb743
# ╠═3325728a-148c-451a-b331-a32a60bd0f0f
# ╠═4eb0ff46-160f-4b65-8e45-c343624ef0dd
# ╠═5379c833-488f-4abc-87b2-64042b71dd0b
# ╠═5af65afe-a5c3-437f-8c74-1ff270e98e47
# ╠═72b67ea3-3073-4501-bc31-0fad01d6ca13
