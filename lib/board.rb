require_relative 'player'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/queen'

class Board
    attr_accessor :board
    attr_accessor :activePlayer
    attr_accessor :nextPlayer
    attr_accessor :display_board

    def initialize()
        @activePlayer=Player.new('player1',"W")
        @nextPlayer=Player.new('player2',"B")
        create()
        populate()
        display()
    end

    def create()
        @board=[]
        8.times do |row|
            @board[row]=[]
            8.times do |col|
                @board[row][col]=nil
            end
        end
        @display_board=[]
        8.times do |row|
            @display_board[row]=[]
            8.times do |col|
                @display_board[row][col]="_"
            end
        end
    end
    def display()
        @display_board.each{|row| p row}
    end
    def display_pieces()
        @board.each{|row| p row; p ""}
    end

    def populate()

        8.times do |col|
            update(Pawn.new([6,col],"W"))
        end
        8.times do |col|
            update(Pawn.new([1,col],"B"))
        end
        update(Rook.new([7,0],"W"))
        update(Rook.new([7,7],"W"))
        update(Rook.new([0,0],"B"))
        update(Rook.new([0,7],"B"))

        update(Knight.new([7,1],"W"))
        update(Knight.new([7,6],"W"))
        update(Knight.new([0,1],"B"))
        update(Knight.new([0,6],"B"))

        update(Bishop.new([7,2],"W"))
        update(Bishop.new([7,5],"W"))
        update(Bishop.new([0,2],"B"))
        update(Bishop.new([0,5],"B"))#
        update(King.new([7,4],"W"))
        update(Queen.new([7,3],"W"))
        update(King.new([0,4],"B"))
        update(Queen.new([0,3],"B"))
    end

    def update(thing)
        @board[thing.current_pos[0]][thing.current_pos[1]]=thing
        @display_board[thing.current_pos[0]][thing.current_pos[1]]=thing.symbol
    end

    def update_pieces_moves()
        @board.each do |row|
            row.each do |col|
                if col !=nil
                    col.update_valid_moves(@board)
                end
            end
        end
    end

    def winCheck()
        return true
    end

    def select()

    end

    def select_move()

    end

    def move(unit,pos)

    end

    def switch_player()

    end

    def play()
        loop do
            piece=select()
            new_pos=select_move()
            move(piece,new_pos)
            display()
            if winCheck==true
                break
            end
            switch_player()
        end
        puts "#{@activePlayer.name} wins"
    end

end

#board=Board.new
#board.create()
#board.display()