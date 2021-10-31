require_relative 'piece'

class Rook < Piece
    attr_reader :first_move
    def initialize(pos,team)
        @first_move=true
        @current_pos=pos
        @team=team
        if @team=="W"
            @other_team="B"
            @symbol="\u265C" #U+265F
        else
            @other_team="W"
            @symbol="\u2656"
        end
        @valid_moves=[]
    end

    def update_valid_moves(board_state)
        @valid_moves=[]
        row=@current_pos[0]
        col=@current_pos[1]

            #Top row
            row.times do |reverse_row|
                cRow=row-reverse_row-1
                if get_piece([cRow,col],board_state)==nil
                    @valid_moves<<[cRow,col]
                elsif get_piece([cRow,col],board_state).team==@other_team
                    @valid_moves<<[cRow,col]
                    break
                else
                    break
                end
            end
            #bot row
            (7-row).times do |down_row|
                cRow=row+down_row+1
                if get_piece([cRow,col],board_state)==nil
                    @valid_moves<<[cRow,col]
                elsif get_piece([cRow,col],board_state).team==@other_team
                    @valid_moves<<[cRow,col]
                    break
                else
                    break
                end
            end
            #left row
            col.times do |left_row|
                cCol=col-left_row-1
                if get_piece([row,cCol],board_state)==nil
                    @valid_moves<<[row,cCol]
                elsif get_piece([row,cCol],board_state).team==@other_team
                    @valid_moves<<[row,cCol]
                    break
                else
                    break
                end
            end
            #right row
            (7-col).times do |right_row|
                cCol=col+right_row+1
                if get_piece([row,cCol],board_state)==nil
                    @valid_moves<<[row,cCol]
                elsif get_piece([row,cCol],board_state).team==@other_team
                    @valid_moves<<[row,cCol]
                    break
                else
                    break
                end
            end

    end

    def get_piece(pos,board_state)
        return board_state[pos[0]][pos[1]]
    end
end
