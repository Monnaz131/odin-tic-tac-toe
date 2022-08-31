# One class, Game
class Game
  @turn_count = 0
  @winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 8], [3, 5, 7]]
  def initialize
    puts 'Player 1 - Please enter your name:'
    @player_one = gets.chomp
    puts 'Player 2 - Please enter your name:'
    @player_two = gets.chomp
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  
  def start
    puts "Two player Tic-Tac-Toe. #{@player_one} will be X, and #{@player_two} will be O. #{@player_one} goes first.
    Type in a number that is available on the board to make your choice."
  end
  
  def display_board
    puts "\r"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' --------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' --------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "\r"
  end

  def play_round
    if @turn_count.even?
      puts 'Player 1 choice: '
      player_one_choice = gets.chomp.to_i
      until @board.include?(player_one_choice)
        puts 'Not a valid option. Try again: '
        player_one_choice = gets.chomp.to_i
      end
      @board[(player_one_choice - 1)] = 'X'
    else
      puts 'Player 2 choice: '
      player_two_choice = gets.chomp.to_i
      until @board.include?(player_two_choice)
        puts 'Not a valid option. Try again: '
        player_two_choice = gets.chomp.to_i
      end
      @board[(player_two_choice - 1)] = 'O'
    end
    @turn_count += 1
    display_board
  end

  def compare_lines
    [0..8].each do |i|
      if @board[i] == 'X'
        @winning_lines.each do |line|
          line.each do |choice|
            if line[choice] == i + 1
              line[choice].replace('X')
            end
          end
        end
      elsif @board[i] == 'O'
        @winning_lines.each do |line|
          line.each do |choice|
            if line[choice] == i + 1
              line[choice].replace('O')
            end
          end
        end
      end
    end
    @winning_lines
  end

  def play_game
    # TODO: Fix @winning_lines problem
    start
    display_board
    winner = ''
    while winner == ''
      compare_lines
      if @turn_count == 10
        puts "It's a draw!"
        break
      end
      @winning_lines.each do |line|
        if line.all?('X')
          winner = @player_one
          puts "#{winner} is the winner! Congratulations!"
          break
        elsif line.all?('O')
          winner = @player_two
          puts "#{winner} is the winner! Congratulations!"
          break
        else
          play_round
        end
      end
    end
  end
end

new_game = Game.new
new_game.play_game