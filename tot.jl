using Plots


N=100000 #kの刻み
M=1000 #epsilonの刻み

function EK(k)
    return -2*cos(k)
end

function D(E)
    return (1/π)*(1/sqrt(4-E*E))
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

d=range(-2,2,length=M)





Ds = D.(d)



plot(d,count_bins(-2,2,M,Ek)/M)
plot!(d,Ds)
savefig("DOS")
