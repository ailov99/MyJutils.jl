"""
    AlgoModule

Umbrella module for various algorithms.
"""
module AlgoModule

__precompile__(true)

using DateTime

"""
    Recursively search a maze for a path from [start_col][start_row] to [dest_col][dest_row]
        @returns true if there is a path, false otherwises
        @throws BoundsError if start is out-of-bounds
"""
function bitmap_maze_search(
    start_row::Int64,
    start_col::Int64,
    dest_row::Int64,
    dest_col::Int64,
    maze_height::Int64,
    maze_width::Int64,
    path_value::Int8,
    maze::Matrix{Int8},
    was_here_map::Matrix{Int8}
)
    # Are we at the destination?
    if start_row == dest_row && start_col == dest_col
        return true
    end

    # If we are crossing into illegal area or were already here?
    if maze[start_row, start_col] != path_value || was_here_map[start_row, start_col] == 1
        return false
    end

    # Was here
    was_here_map[start_row, start_col] = 1;

    # Go left
    can_go_left = start_col > 1 && maze[start_row, start_col-1] == path_value
    if can_go_left
        if bitmap_maze_search(
            start_row, 
            start_col-1, 
            dest_row, 
            dest_col, 
            maze_height, 
            maze_width, 
            path_value, 
            maze, 
            was_here_map
        )
            return true
        end
    end
    # Go right
    can_go_right = start_col < maze_width && maze[start_row, start_col+1] == path_value
    if can_go_right
        if bitmap_maze_search(
            start_row, 
            start_col+1, 
            dest_row, 
            dest_col, 
            maze_height, 
            maze_width, 
            path_value, 
            maze, 
            was_here_map
        )
            return true
        end
    end    
    # Go up
    can_go_up = start_row > 1 && maze[start_row-1, start_col] == path_value
    if can_go_up
        if bitmap_maze_search(
            start_row-1, 
            start_col, 
            dest_row, 
            dest_col, 
            maze_height, 
            maze_width, 
            path_value, 
            maze, 
            was_here_map
        )
            return true
        end
    end
    # Go down
    can_go_down = start_row < maze_height && maze[start_row+1, start_col] == path_value
    if can_go_down
        if bitmap_maze_search(
            start_row+1, 
            start_col, 
            dest_row, 
            dest_col, 
            maze_height, 
            maze_width, 
            path_value, 
            maze, 
            was_here_map
        )
            return true
        end
    end

    return false
end

"""
    Kahan correction for floats
"""
function fadd_corrected(a::Float64, b::Float64)
    # TODO
end

"""
    Exponential moving average implementation with time-critical alpha adjustment
"""
mutable struct SMovingAvg
    current_avg::Float64
    alpha::Float64
    time_of_last_addition::DateTime
end

function SMovingAvg()
    """Ctor"""
    return SMovingAvg(0.0, 0.5, 0)
end

function add_new_number(moving_avg::SMovingAvg)
    """Add a new number, updating the moving average"""
    # TODO
end

end