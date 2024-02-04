module AlgoModule

__precompile__(true)

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
    start_row == dest_row && start_col == dest_col && return true

    # If we are crossing into illegal area or were already here?
    maze[start_row, start_col] != path_value || was_here_map[start_row, start_col] == 1 && return false

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

end