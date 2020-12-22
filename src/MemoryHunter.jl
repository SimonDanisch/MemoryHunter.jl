module MemoryHunter

function print_sizes(threshold=5#=mb=#)
    @show Base.format_bytes(Sys.free_memory())
    biggest_vars = Pair{String, Float64}[]
    visited = IdDict()
    # just make sure the numbers just look different because
    # of gc running inconistantly
    GC.gc(true)
    for m in values(Base.loaded_modules)
        if !haskey(visited, m)
            visited[m] = true
            for vs in names(m, all = true)
                if isdefined(m, vs)
                    v = getfield(m, vs)
                    if !isa(v, Function) && !haskey(visited, v)
                        visited[v] = true
                        x = Base.summarysize(v)
                        if x > threshold * 10^6
                            push!(biggest_vars, string(m, ".", vs) => x)
                        end
                    end
                end
            end
        end
    end
    sort!(biggest_vars, by=last, rev=true)
    for (var, s) in biggest_vars
        println(var, ": ", Base.format_bytes(s))
    end
end

end
