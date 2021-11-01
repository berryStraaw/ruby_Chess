require_relative 'piece'

class Queen < Piece
    attr_reader :first_move
    def initialize(pos,team)
        @first_move=true
        @current_pos=pos
        @team=team
        if @team=="W"
            @symbol="\u265B" #U+265F
        else
            @symbol="\u2655"
        end
        @valid_moves=[]
    end

    def update_valid_moves(board_state)
        @valid_moves=[]
        row=@current_pos[0]
        col=@current_pos[1]

        #1
        nRow=row-2
        nCol=col-1
        if nRow>=0 && nCol>=0 && nRow<8 && nCol<8
            if get_piece([nRow,nCol],board_state)==nil
                @valid_moves<<[nRow,nCol]
            elsif get_piece([nRow,nCol],board_state).team!=@team
                @valid_moves<<[nRow,nCol]
            end
        end
    end

    def get_piece(pos,board_state)
        return board_state[pos[0]][pos[1]]
    end
end
