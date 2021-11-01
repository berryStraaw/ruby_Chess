require_relative 'piece'

class Bishop < Piece
    attr_reader :first_move
    def initialize(pos,team)
        @first_move=true
        @current_pos=pos
        @team=team
        if @team=="W"
            @symbol="\u265D" #U+265F
        else
            @symbol="\u2657"
        end
        @valid_moves=[]
    end

    def update_valid_moves(board_state)
        @valid_moves=[]
        @invalid_moves=[]
        row=@current_pos[0]
        col=@current_pos[1]

        #top left
        8.times do |top|
            tlRow=row-top-1
            tlCol=col-top-1
            if tlRow>=0 && tlCol>=0 && tlRow<8 && tlCol<8
                if get_piece([tlRow,tlCol],board_state)==nil
                    @valid_moves<<[tlRow,tlCol]
                else
                    @valid_moves<<[tlRow,tlCol]
                    if get_piece([tlRow,tlCol],board_state).team==@team
                        @invalid_moves<<[tlRow,tlCol]
                    end
                    break
                end
            end
        end
        #top right
        8.times do |top|
            tlRow=row-top-1
            tlCol=col+top+1
            if tlRow>=0 && tlCol>=0 && tlRow<8 && tlCol<8
                if get_piece([tlRow,tlCol],board_state)==nil
                    @valid_moves<<[tlRow,tlCol]
                else
                    @valid_moves<<[tlRow,tlCol]
                    if get_piece([tlRow,tlCol],board_state).team==@team
                        @invalid_moves<<[tlRow,tlCol]
                    end
                    break
                end
            end
        end

        #bot right
        8.times do |top|
            tlRow=row+top+1
            tlCol=col+top+1
            if tlRow>=0 && tlCol>=0 && tlRow<8 && tlCol<8
                if get_piece([tlRow,tlCol],board_state)==nil
                    @valid_moves<<[tlRow,tlCol]
                else
                    @valid_moves<<[tlRow,tlCol]
                    if get_piece([tlRow,tlCol],board_state).team==@team
                        @invalid_moves<<[tlRow,tlCol]
                    end
                    break
                end
            end
        end

        #bot left
        8.times do |top|
            tlRow=row+top+1
            tlCol=col-top-1
            if tlRow>=0 && tlCol>=0 && tlRow<8 && tlCol<8
                if get_piece([tlRow,tlCol],board_state)==nil
                    @valid_moves<<[tlRow,tlCol]
                else
                    @valid_moves<<[tlRow,tlCol]
                    if get_piece([tlRow,tlCol],board_state).team==@team
                        @invalid_moves<<[tlRow,tlCol]
                    end
                    break
                end
            end
        end
    end

    def get_piece(pos,board_state)
        return board_state[pos[0]][pos[1]]
    end
    def update_pos(pos)
        @current_pos=pos
    end
end
