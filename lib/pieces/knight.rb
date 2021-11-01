require_relative 'piece'

class Knight < Piece
    attr_reader :first_move
    def initialize(pos,team)
        @first_move=true
        @current_pos=pos
        @team=team
        if @team=="W"
            @symbol="\u265E" #U+265F
        else
            @symbol="\u2658"
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
            else
                @valid_moves<<[nRow,nCol]
                if get_piece([nRow,nCol],board_state).team==@team
                    @invalid_moves<<[nRow,nCol]
                end
            end
        end
        #2
        nRow=row-2
        nCol=col+1
        if nRow>=0 && nCol>=0 && nRow<8 && nCol<8
            if get_piece([nRow,nCol],board_state)==nil
                @valid_moves<<[nRow,nCol]
            else
                @valid_moves<<[nRow,nCol]
                if get_piece([nRow,nCol],board_state).team==@team
                    @invalid_moves<<[nRow,nCol]
                end
            end
        end
        #3
        nRow=row-1
        nCol=col+2
        if nRow>=0 && nCol>=0 && nRow<8 && nCol<8
            if get_piece([nRow,nCol],board_state)==nil
                @valid_moves<<[nRow,nCol]
            else
                @valid_moves<<[nRow,nCol]
                if get_piece([nRow,nCol],board_state).team==@team
                    @invalid_moves<<[nRow,nCol]
                end
            end
        end
        #4
        nRow=row+1
        nCol=col+2
        if nRow>=0 && nCol>=0 && nRow<8 && nCol<8
            if get_piece([nRow,nCol],board_state)==nil
                @valid_moves<<[nRow,nCol]
            else
                @valid_moves<<[nRow,nCol]
                if get_piece([nRow,nCol],board_state).team==@team
                    @invalid_moves<<[nRow,nCol]
                end
            end
        end
        #5
        nRow=row+2
        nCol=col+1
        if nRow>=0 && nCol>=0 && nRow<8 && nCol<8
            if get_piece([nRow,nCol],board_state)==nil
                @valid_moves<<[nRow,nCol]
            else
                @valid_moves<<[nRow,nCol]
                if get_piece([nRow,nCol],board_state).team==@team
                    @invalid_moves<<[nRow,nCol]
                end
            end
        end
        #6
        nRow=row+2
        nCol=col-1
        if nRow>=0 && nCol>=0 && nRow<8 && nCol<8
            if get_piece([nRow,nCol],board_state)==nil
                @valid_moves<<[nRow,nCol]
            else
                @valid_moves<<[nRow,nCol]
                if get_piece([nRow,nCol],board_state).team==@team
                    @invalid_moves<<[nRow,nCol]
                end
            end
        end
        #7
        nRow=row+1
        nCol=col-2
        if nRow>=0 && nCol>=0 && nRow<8 && nCol<8
            if get_piece([nRow,nCol],board_state)==nil
                @valid_moves<<[nRow,nCol]
            else
                @valid_moves<<[nRow,nCol]
                if get_piece([nRow,nCol],board_state).team==@team
                    @invalid_moves<<[nRow,nCol]
                end
            end
        end
        #8
        nRow=row-1
        nCol=col-2
        if nRow>=0 && nCol>=0 && nRow<8 && nCol<8
            if get_piece([nRow,nCol],board_state)==nil
                @valid_moves<<[nRow,nCol]
            else
                @valid_moves<<[nRow,nCol]
                if get_piece([nRow,nCol],board_state).team==@team
                    @invalid_moves<<[nRow,nCol]
                end
            end
        end
    end

    def get_piece(pos,board_state)
        return board_state[pos[0]][pos[1]]
    end
end
