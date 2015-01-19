module Fachade
  class Board

    $LOAD_PATH << '.'
    require 'matrix'
    require 'game'
    require 'computer'

    attr_accessor :game, :computer

    def initialize
      @game = Core::Game.new
    end

    def get_tictactoe
      @game.tictactoe
    end

    def play_versus_player
      @computer = nil
    end

    def play_versus_computer
      @computer = Computer.new(@game)
    end

    def is_vs_computer
      !@computer.nil?
    end

    def player_entry(row, column, mark)
      @game.player_entry(row, column, mark)
      @computer.generate_computer_entry(row, column) if !@computer.nil? && !is_game_over?
    end

    def is_game_over?
      (@game.is_straigth_line_full? || @game.is_diagonal_full? || @game.is_tictactoe_full?) ? true : false
    end
  end
end
