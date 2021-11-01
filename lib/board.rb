require_relative 'player'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require 'json'


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

        update(Pawn.new([5,0],"W"))
        update(Pawn.new([5,1],"B"))

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
    def delete(pos)
        @board[pos[0]][pos[1]]=nil
        @display_board[pos[0]][pos[1]]="_"
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
        return false
    end
    def verify_input(pos)
        if pos[0]>=0 && pos[1]>=0 && pos[0]<8 && pos[1]<8
            return true
        end
        p "invalid input"
        return false
    end

    def ask_input()
        loop do
            pos=gets.chomp
            begin
                pos=JSON.parse(pos)
            rescue
                puts "bad input"
                next
            end
            return pos if verify_input(pos)
        end
    end
    def select()
        puts "Please choose a piece from #{@activePlayer.team} Team"
        loop do
            pos=ask_input()
            row= pos[0]
            col= pos[1]
            if @board[row][col]!= nil
                if@board[row][col].team==@activePlayer.team
                    thing=@board[row][col]
                    thing.update_valid_moves(@board)
                    if thing.valid_moves-thing.invalid_moves!=[]
                        return @board[row][col]
                    else
                        puts "this unit has no valid moves"
                    end
                end
            end
        end
    end

    def select_move(unit)
        moves=unit.valid_moves-unit.invalid_moves
        puts "choose from #{moves}"
        loop do
            pos=ask_input()
            moves.each do |move|
                if pos==move
                    return pos
                end
            end
        end
    end

    def move(unit,pos)
        delete(unit.current_pos)
        unit.update_pos(pos)
        update(unit)
    end

    def switch_player()

    end

    def play()
        loop do
            piece=select()
            new_pos=select_move(piece)
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