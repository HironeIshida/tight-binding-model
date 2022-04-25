#Ek=-2tcos(ka)を使って状態密度を定義から計算する．D(E)=\sum_{k}\delta(E-Ek)
#=
t=1
a=1
=#


using Plots


N=100000 #kの刻み
M=100000 #epsilonの刻み

function EK(k)
    return -2*cos(k)
end

k=range(-π,π,length=N)
Ek=EK.(k)


function count_bins(xmin,xmax,n,data)
    d=range(xmin,xmax,length=n)
    count=zeros(Int64,n)

    Delta=(xmax-xmin)/n

    for i in data
        e=convert(Int64,ceil((i-xmin)/Delta))
        count[e] += 1
    end

    return count
end

#println(count_bins(-2,2,M,Ek))

d=range(-3,3,length=N)

plot(d,count_bins(-3,3,M,Ek))
savefig("DOS-def")