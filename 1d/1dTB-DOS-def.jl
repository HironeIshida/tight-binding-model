using Plots

N = 1000000 #kの刻み
M = 1000 #epsilonの刻み

function EK(k)
    return -2*cos(k)
end

k = range(-π, π, length=N)
Ek = EK.(k)

function count_bins(xmin, xmax, n, data)
    d = range(xmin, xmax, length=n)
    count = zeros(Int64, n)

    Delta = (xmax-xmin)/n

    for i in data
        e = convert(Int64,ceil((i-xmin)/Delta))
        count[e] += 1
    end

    return count
end


#規格化定数を求める
Integral = 0

for i in 2:M
    S = (count_bins(-2,2,M,Ek)[i-1] + count_bins(-3,3,M,Ek)[i]) * (4 / M) / 2
    global Integral += S
end

d = range(-2, 2, length=M)

scatter(d, count_bins(-2, 2, M, Ek)/Integral, markersize=2)
savefig("DOS-def")
