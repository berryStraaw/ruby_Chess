require_relative 'piece'

class Pawn < Piece
    attr_reader :first_move
    def initialize(pos,team)
        @first_move=true
        @current_pos=pos
        @team=team
        if @team=="W"
            @symbol="\u265F" #U+265F
        else
            @symbol="\u2659"
        end
        @valid_moves=[]
    end

    def update_valid_moves(board_state)
        @valid_moves=[]
        @invalid_moves=[]
        row=@current_pos[0]
        col=@current_pos[1]
        if @team=="W"
            if row==0
                return
            end
            if get_piece([row-1,col],board_state)==nil
                @valid_moves<<[row-1,col]
                if @first_move
                    @valid_moves<<[row-2,col]
                    @first_move=false
                end
            end
            # if not empty and not enemy
            if get_piece([row-1,col],board_state)!=nil && get_piece([row-1,col],board_state).team==@team
                @valid_moves<<[row-1,col]
                @invalid_moves<<[row-1,col]
            end


            if get_piece([row-1,col-1],board_state)!=nil
                if get_piece([row-1,col-1],board_state).team!=@team
                    @valid_moves<<[row-1,col-1]
                end
            end
            if  get_piece([row-1,col+1],board_state)!=nil
                if get_piece([row-1,col+1],board_state).team!=@team
                    @valid_moves<<[row-1,col+1]
                end
            end

        end
        if @team=="B"
            if row==7
                return
            end
            if get_piece([row+1,col],board_state)==nil
                @valid_moves<<[row+1,col]
                if @first_move
                    @valid_moves<<[row+2,col]
                    @first_move=false
                end
            end
            # if not empty and not enemy
            if get_piece([row+1,col],board_state)!=nil && get_piece([row+1,col],board_state).team==@team
                @valid_moves<<[row-1,col]
                @invalid_moves<<[row-1,col]
            end
            
            if get_piece([row+1,col-1],board_state)!=nil
                if get_piece([row+1,col-1],board_state).team!=@team
                    @valid_moves<<[row+1,col-1]
                end
            end
            if  get_piece([row+1,col+1],board_state)!=nil
                if get_piece([row+1,col+1],board_state).team!=@team
                    @valid_moves<<[row+1,col+1]
                end
            end

        end
    end
    
    def get_piece(pos,board_state)
        return board_state[pos[0]][pos[1]]
    end

end
