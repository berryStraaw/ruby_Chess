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
        @invalid_moves=[]
        row=@current_pos[0]
        col=@current_pos[1]

        #Rook moveset
        row.times do |reverse_row|
            cRow=row-reverse_row-1
            if get_piece([cRow,col],board_state)==nil
                @valid_moves<<[cRow,col]
            else
                @valid_moves<<[cRow,col]
                if get_piece([cRow,col],board_state).team==@team
                    @invalid_moves<<[cRow,col]
                end
                break
            end
        end
        #bot row
        (7-row).times do |down_row|
            cRow=row+down_row+1
            if get_piece([cRow,col],board_state)==nil
                @valid_moves<<[cRow,col]
            else
                @valid_moves<<[cRow,col]
                if get_piece([cRow,col],board_state).team==@team
                    @invalid_moves<<[cRow,col]
                end
                break
            end
        end
        #left row
        col.times do |left_row|
            cCol=col-left_row-1
            if get_piece([row,cCol],board_state)==nil
                @valid_moves<<[row,cCol]
            else
                @valid_moves<<[row,cCol]
                if get_piece([row,cCol],board_state).team==@team
                    @invalid_moves<<[row,cCol]
                end
                break
            end
        end
        #right row
        (7-col).times do |right_row|
            cCol=col+right_row+1
            if get_piece([row,cCol],board_state)==nil
                @valid_moves<<[row,cCol]
            else
                @valid_moves<<[row,cCol]
                if get_piece([row,cCol],board_state).team==@team
                    @invalid_moves<<[row,cCol]
                end
                break
            end
        end

        # bishop moveset
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
