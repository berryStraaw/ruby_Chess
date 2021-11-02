require_relative 'piece'

class Pawn < Piece
    attr_reader :first_move
    attr_accessor :has_moved
    attr_accessor :a_moves
    def initialize(pos,team)
        @first_move=true
        @current_pos=pos
        @has_moved=false
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
        @a_moves=[]
        @invalid_moves=[]
        row=@current_pos[0]
        col=@current_pos[1]
        if @team=="W"
            @a_moves<<[row-1,col-1]
            @a_moves<<[row-1,col+1]
            if row==0
                return
            end
            if get_piece([row-1,col],board_state)==nil
                @valid_moves<<[row-1,col]
                if @has_moved==false
                    if get_piece([row-2,col],board_state)==nil
                        @valid_moves<<[row-2,col]
                    end
                end
            end
            # if not empty and not enemy
            if get_piece([row-1,col],board_state)!=nil && get_piece([row-1,col],board_state).team==@team
                @valid_moves<<[row-1,col]
                @invalid_moves<<[row-1,col]
            end

            #attack
            if get_piece([row-1,col-1],board_state)!=nil
                if row-1>=0 && col-1>=0
                    if get_piece([row-1,col-1],board_state).team!=@team
                        @valid_moves<<[row-1,col-1]
                    end
                end
            end
            if  get_piece([row-1,col+1],board_state)!=nil
                if row-1>=0 && col+1<=7
                    if get_piece([row-1,col+1],board_state).team!=@team
                        @valid_moves<<[row-1,col+1]
                    end
                end
            end

        end
        if @team=="B"
            @a_moves<<[row+1,col-1]
            @a_moves<<[row+1,col+1]
            if row==7
                return
            end
            if get_piece([row+1,col],board_state)==nil
                @valid_moves<<[row+1,col]
                if @has_moved==false
                    if get_piece([row+2,col],board_state)==nil
                        @valid_moves<<[row+2,col]
                    end
                end
            end
            # if not empty and not enemy
            if get_piece([row+1,col],board_state)!=nil && get_piece([row+1,col],board_state).team==@team
                @valid_moves<<[row-1,col]
                @invalid_moves<<[row-1,col]
            end
            
            
            if get_piece([row+1,col-1],board_state)!=nil
                if row+1<=7 && col-1>=0
                    if get_piece([row+1,col-1],board_state).team!=@team
                        @valid_moves<<[row+1,col-1]
                    end
                end
            end
            if  get_piece([row+1,col+1],board_state)!=nil
                if row+1<=7 && col+1<=7
                    if get_piece([row+1,col+1],board_state).team!=@team
                        @valid_moves<<[row+1,col+1]
                    end
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
