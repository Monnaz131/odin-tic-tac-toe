# One class, Game
class Game
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
  end
  new_game = Game.new
  new_game.start
  new_game.display_board