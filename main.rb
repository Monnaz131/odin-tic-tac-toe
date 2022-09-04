# One class, Game
class Game
  def initialize
    puts 'Player 1 - Please enter your name:'
    @player_one = gets.chomp
    puts 'Player 2 - Please enter your name:'
    @player_two = gets.chomp
    @board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @turn_count = 0
    @winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    @winner = ''
  end
  
  def start
    puts "Two player Tic-Tac-Toe. #{@player_one} will be X, and #{@player_two} will be O. #{@player_one} goes first.
    Type in a number that is available on the board to make your choice."
  end
  
  def display_board
    puts "\r"
    puts " #{@board[1]} | #{@board[2]} | #{@board[3]} "
    puts ' --+---+-- '
    puts " #{@board[4]} | #{@board[5]} | #{@board[6]} "
    puts ' --+---+-- '
    puts " #{@board[7]} | #{@board[8]} | #{@board[9]} "
    puts "\r"
  end

  def play_round
    if @turn_count.even? || @turn_count.zero?
      puts "#{@player_one}'s choice: "
      player_one_choice = gets.to_i
      until @board.include?(player_one_choice)
        puts 'Not a valid option. Try again: '
        player_one_choice = gets.to_i
      end
      @board[player_one_choice] = 'X'
    else
      puts "#{@player_two}'s choice: "
      player_two_choice = gets.to_i
      until @board.include?(player_two_choice)
        puts 'Not a valid option. Try again: '
        player_two_choice = gets.to_i
      end
      @board[player_two_choice] = 'O'
    end
    @turn_count += 1
    display_board
  end

  def compare_lines
    @winning_lines.any? do |line|
      if line.all? { |position| @board[position] == 'X' }
        @winner = @player_one
      elsif line.all? { |position| @board[position] == 'O' }
        @winner = @player_two
      end
    end
  end

  def play_game
    while @winner == ''
      compare_lines
      if @turn_count == 9
        puts "It's a draw!"
        display_board
        return
      elsif @winner == @player_one || @winner == @player_two
        puts "#{@winner} is the winner! Congratulations!"
        return
      else
        play_round
      end
    end
  end
end

new_game = Game.new
new_game.start
new_game.display_board
new_game.play_game
