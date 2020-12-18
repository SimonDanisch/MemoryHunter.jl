using MemoryHunter
using Documenter

makedocs(;
    modules=[MemoryHunter],
    authors="SimonDanisch <sdanisch@gmail.com> and contributors",
    repo="https://github.com/SimonDanisch/MemoryHunter.jl/blob/{commit}{path}#L{line}",
    sitename="MemoryHunter.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://SimonDanisch.github.io/MemoryHunter.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/SimonDanisch/MemoryHunter.jl",
)
