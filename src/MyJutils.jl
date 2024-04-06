module MyJutils

__precompile__(true)

include("ModulesIncludes.jl")

using .AlgoModule: 
    bitmap_maze_search,
    halton_sequence,
    fibonacci
export bitmap_maze_search,
    halton_sequence, fibonacci

end
