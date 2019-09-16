def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|index| board[index] == "X"}
      return combination
    elsif combination.all? {|index| board[index] == "O"}
      return combination
    else
      false
    end
  end
  false
end

def full?(board)
  board.all? do |location|
    if ((location == "X") || (location == "O"))
      true
    else
      false
    end
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  (((full?(board)) || (won?(board))) || (draw?(board)))
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
