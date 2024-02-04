module MyJutils

__precompile__(true)

include("ModulesIncludes.jl")

using .AlgoModule: 
    bitmap_maze_search
export bitmap_maze_search

end
