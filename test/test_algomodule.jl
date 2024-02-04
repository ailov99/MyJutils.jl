module bitmap_maze_search_1byn
using MyJutils
using MyJutils.AlgoModule
using Test
function test()
    """
    Maze = 1100
    """
    agent_start_row = 1
    agent_start_col = 4
    agent_dest_row = 1
    agent_dest_col = 3
    maze_height = 1
    maze_width = 4
    value_of_path::Int8 = 0
    maze = Matrix{Int8}([1 1 0 0;])
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)

    @test true == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_start_row = 1
    agent_start_col = 3
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test true == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_start_row = 1
    agent_start_col = 1
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test false == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_dest_row = 1
    agent_dest_col = 2
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test false == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    value_of_path = 1
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test true == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_start_row = 1
    agent_start_col = 5 # Out-of-bounds
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test_throws BoundsError bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )
end
end
using .bitmap_maze_search_1byn
bitmap_maze_search_1byn.test()

module bitmap_maze_search_nby1
using MyJutils
using MyJutils.AlgoModule
using Test
function test()
    """
    Maze = 0
           0
           1
           1
    """
    agent_start_row = 1
    agent_start_col = 1
    agent_dest_row = 2
    agent_dest_col = 1
    maze_height = 4
    maze_width = 1
    value_of_path::Int8 = 0
    maze = Matrix{Int8}([0 0 1 1]')
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)

    @test true == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    value_of_path = 1
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test false == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_start_row = 3
    agent_start_col = 1
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test false == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_dest_row = 3
    agent_dest_col = 1
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test true == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_dest_col = 2 # Out-of-bounds
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test false == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )
end
end
using .bitmap_maze_search_nby1
bitmap_maze_search_nby1.test()

module bitmap_maze_search_nbyn
using MyJutils
using MyJutils.AlgoModule
using Test
function test()
    """
    10x20
    Maze = 11111111111111111111
           11000000000000000101
           11111111111111110000
           11111111111111110000
           11000000000000000111
           00011111111111111111
           00111111111111111111
           10000000000000001111
           11111111111111111111
           11111111111111111111
    """
    agent_start_row = 2
    agent_start_col = 3
    agent_dest_row = 8
    agent_dest_col = 16
    maze_height = 10
    maze_width = 20
    value_of_path::Int8 = 0
    maze = Matrix{Int8}(
        [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
         1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1;
         1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0;
         1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0;
         1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1;
         0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
         0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
         1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1;
         1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
         1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
        ]
    )
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)

    @test true == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_dest_col = 1
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test false == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_start_col = 1
    agent_start_row = 1
    agent_dest_row = 3
    agent_dest_col = 16
    value_of_path = 1
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test true == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )

    agent_dest_col = 21 # Out-of-bounds
    was_here_map = Matrix{Int8}(undef, maze_height, maze_width)
    @test false == bitmap_maze_search(
        agent_start_row, 
        agent_start_col, 
        agent_dest_row, 
        agent_dest_col, 
        maze_height, 
        maze_width, 
        value_of_path, 
        maze, 
        was_here_map
    )
end
end
using .bitmap_maze_search_nbyn
bitmap_maze_search_nbyn.test()