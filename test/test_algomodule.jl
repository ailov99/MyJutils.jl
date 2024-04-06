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
end # module bitmap_maze_search_1byn
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
end # module bitmap_maze_search_nby1
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
end # module bitmap_maze_search_nbyn
using .bitmap_maze_search_nbyn
bitmap_maze_search_nbyn.test()

module halton_sequence_test

    using MyJutils
    using MyJutils.AlgoModule
    using Test

    function test()
        halton_seq_base_2 = []
        halton_seq_base_3 = []
        halton_seq_base_5 = []
        halton_seq_base_7 = []
        halton_seq_base_11 = []
        halton_seq_base_13 = []
        halton_seq_base_17 = []

        # Parse test data
        tryparse_float_xform = x -> tryparse(Float64, x)
        try
            for line in eachline("test_data/halton_07_00100.txt")
                startswith(line, "#") && continue
                
                tokenised_line = split(line, "  ")
                if length(tokenised_line) != 7
                    throw("Failed to tokenize $line")
                end
                parsed_tokenised_line = tryparse_float_xform.(tokenised_line)
  
                push!(halton_seq_base_2, parsed_tokenised_line[1])
                push!(halton_seq_base_3, parsed_tokenised_line[2])
                push!(halton_seq_base_5, parsed_tokenised_line[3])
                push!(halton_seq_base_7, parsed_tokenised_line[4])
                push!(halton_seq_base_11, parsed_tokenised_line[5])
                push!(halton_seq_base_13, parsed_tokenised_line[6])
                push!(halton_seq_base_17, parsed_tokenised_line[7])
            end
        catch e
            println("Halton seq test: failed to parse $e")
        end

        # Tests
        seq_length = length(halton_seq_base_2)

        # Note: We skip the 1st number in the sequence (0.0...)
        for (index, n) in enumerate(halton_sequence(seq_length-1, 2))
            @test abs(halton_seq_base_2[index+1] - n) <= 1e-6
        end
        for (index, n) in enumerate(halton_sequence(seq_length-1, 3))
            @test abs(halton_seq_base_3[index+1] - n) <= 1e-6
        end
        for (index, n) in enumerate(halton_sequence(seq_length-1, 5))
            @test abs(halton_seq_base_5[index+1] - n) <= 1e-6
        end
        for (index, n) in enumerate(halton_sequence(seq_length-1, 7))
            @test abs(halton_seq_base_7[index+1] - n) <= 1e-6
        end
        for (index, n) in enumerate(halton_sequence(seq_length-1, 11))
            @test abs(halton_seq_base_11[index+1] - n) <= 1e-6
        end
        for (index, n) in enumerate(halton_sequence(seq_length-1, 13))
            @test abs(halton_seq_base_13[index+1] - n) <= 1e-6
        end
        for (index, n) in enumerate(halton_sequence(seq_length-1, 17))
            @test abs(halton_seq_base_17[index+1] - n) <= 1e-6
        end
    end

end # module halton_sequence_test

using .halton_sequence_test
halton_sequence_test.test()

module fibonacci_test

    using MyJutils
    using MyJutils.AlgoModule
    using Test

    function test()
        first_50_fib = [
            1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 
            233, 377, 610, 987, 1_597, 2_584, 4_181, 6_765, 
            10_946, 17_711, 28_657, 46_368, 75_025, 121_393, 
            196_418, 317_811, 514_229, 832_040, 1_346_269, 2_178_309,
            3_524_578, 5_702_887, 9_227_465, 14_930_352, 24_157_817, 39_088_169,
            63_245_986, 102_334_155, 165_580_141, 267_914_296, 433_494_437,
            701_408_733, 1_134_903_170, 1_836_311_903, 2_971_215_073, 4_807_526_976,
            7_778_742_049, 12_586_269_025
        ]

        # Note: '≈' uses isapprox(...) with default args (epsilon of 1e-9)
        for (x,y) in zip(fibonacci(50), first_50_fib)
            @test x ≈ y
        end
    end

end # module fibonacci_test

using .fibonacci_test
fibonacci_test.test()