#tight-binding model の状態密度を，計算した表式から計算する．

using Plots

function D(E)
    return (1/π)*(1/sqrt(4-E*E))
end

n=1000
Es = range(-2,2,length=n)
Ds = D.(Es)

plot(Es,Ds,
    xlabel = "energy",
    ylabel = "dencity of state (DOS)",
    label = "D(ϵ)",
    title = "DOS-cal"
)
savefig("DOS-cal")