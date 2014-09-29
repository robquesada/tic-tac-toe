class Computer

  def initialize(game)
    @game = game
  end

  def generate_computer_entry(row_player, column_player)
    col = column_player
    row = row_player
    (block_player_horizontal(row, col) || block_player_vertical(row, col) ||
     block_player_diagonal(row, col)) ? true : generate_random_entry
  end

  def block_player_diagonal(row, col)
    if @game.tictactoe[2,2] == " X"
      if check_spaces_to_block(1,1,3,3)
        insert_computer_mark(3, 3)
      elsif check_spaces_to_block(3,3,1,1)
        insert_computer_mark(1, 1)
      elsif check_spaces_to_block(1,3,3,1)
        insert_computer_mark(3, 1)
      elsif check_spaces_to_block(3,1,1,3)
        insert_computer_mark(1, 3)
      else
        return false
      end
    else
      return false
    end
    return true
  end

  def block_player_horizontal(row, col)
    case col
    when 1
      return check_block_player_horizontal(row, col, 1, 2)
    when 2
      return check_block_player_horizontal(row, col, -1, 1)
    when 3
      return check_block_player_horizontal(row, col, -1, -2)
    end
  end

  def check_block_player_horizontal(row, col, spaces_to_move_1, spaces_to_move_2)
    if check_spaces_to_block(row, col+spaces_to_move_1, row, col+spaces_to_move_2)
      insert_computer_mark(row, col+spaces_to_move_2)
    elsif check_spaces_to_block(row, col+spaces_to_move_2, row, col+spaces_to_move_1)
      insert_computer_mark(row, col+spaces_to_move_1)
    else
      return false
    end
    return true
  end

  def check_spaces_to_block(row_marked, col_marked, row_empty, col_empty)
    (@game.tictactoe[row_marked, col_marked] == " X" && @game.tictactoe[row_empty, col_empty] == " ") ? true : false
  end

  def block_player_vertical(row, col)
    case row
    when 1
      return check_block_player_vertical(row, col, 1, 2)
    when 2
      return check_block_player_vertical(row, col, -1, 1)
    when 3
      return check_block_player_vertical(row, col, -1, -2)
    end
  end

  def check_block_player_vertical(row, col, spaces_to_move_1, spaces_to_move_2)
    if check_spaces_to_block(row+spaces_to_move_1, col, row+spaces_to_move_2, col)
      insert_computer_mark(row+spaces_to_move_2, col)
    elsif check_spaces_to_block(row+spaces_to_move_2, col, row+spaces_to_move_1, col)
      insert_computer_mark(row+spaces_to_move_1, col)
    else
      return false
    end
    return true
  end

  def insert_computer_mark(row, col)
    @game.tictactoe[row, col] << "O"
  end

  def generate_random_entry
    row, col = 1
    loop do
      row = 1 + rand(3)
      col = 1 + rand(3)
      break if @game.is_space_empty?(row, col)
    end
    insert_computer_mark(row, col)
  end

end
