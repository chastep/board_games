class Game
  attr_reader :p1, :p2
  attr_accessor :board

  def initialize(p1, p2, board)
    @p1 = p1
    @p2 = p2
    @board = board
  end

  def play
    game_over, tie = false
    puts "---------------"
    puts "Welcome to Tic Tac Toe!"
    puts "To quit, enter q at any time"
    until game_over || tie
      player = whose_turn?
      board.display
      gather_and_input_choice(player)
      game_over = true if winner?
      puts "#{player.name} Wins!" if game_over
      board.display if game_over
      tie = true unless tie?
      puts 'Cats Game!' if tie
      board.display if tie
    end
  end

  def whose_turn?
    count = board.count
    if count[:X] > count[:O]
      puts "It's #{o_player.name}'s turn!"
      o_player
    elsif count[:X] == count[:O] || count[:O] > count[:X]
      puts "It's #{x_player.name}'s turn!"
      x_player
    end
  end

  def gather_and_input_choice(player)
    choice_prompt = "#{player.name}, please select some coordinates (ie 'A1' or 'C2')"
    puts choice_prompt
    while coor = gets.chomp.downcase
      if coor == 'q' || coor == 'quit'
        puts 'Goodbye!'
        exit
      elsif valid_choice?(coor)
        update_board(coor, player)
        break
      else
        puts 'Invalid choice, please try again!'
        puts choice_prompt
      end
    end
  end

  def valid_choice?(coor)
    board.grid[coor.to_sym] == '-'
  end

  def update_board(coor, player)
    board.grid[coor.to_sym] = player.symbol 
  end

  def winner?
    board.winning_patterns.each do |pattern|
      value = pattern.uniq
      next if value.include?('-')
      return true if value.count <= 1
    end
    false
  end

  def tie?
    board.grid.values.include?('-')
  end

  def x_player
    p1.symbol == 'X' ? p1 : p2
  end

  def o_player
    p1.symbol == 'O' ? p1 : p2
  end
end
