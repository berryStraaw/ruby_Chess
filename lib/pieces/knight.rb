require_relative 'piece'

class Knight < Piece
    attr_reader :first_move
    def initialize(pos,team)
        @first_move=true
        @current_pos=pos
        @team=team
        if @team=="W"
            @other_team="B"
            @symbol="\u265E" #U+265F
        else
            @other_team="W"
            @symbol="\u2658"
        end
        @valid_moves=[]
    end

    def update_valid_moves(board_state)
        if @first_move
            @valid_moves<<[@current_pos[0],@current_pos[1]+2]
            @first_move=false
        end
        @valid_moves<<[@current_pos[0],@current_pos[1]+2]
        
        if board_state[@current_pos[0]+2,@current_pos[1]+1]!="_"
            piece=board_state[@current_pos[0]+2,@current_pos[1]+1]
            if piece.team==@other_team
                @valid_moves<<[@current_pos[0]+2,@current_pos[1]+1]
            end
        end
        if board_state[@current_pos[0]+2,@current_pos[1]+1]!="_" && board_state[@current_pos[0]+2,@current_pos[1]-1].team == @other_team
            @valid_moves<<[@current_pos[0]+2,@current_pos[1]-1]
        end
    end
end
