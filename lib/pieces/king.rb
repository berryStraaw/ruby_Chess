require_relative 'piece'

class King < Piece
    attr_reader :first_move
    def initialize(pos,team)
        @first_move=true
        @current_pos=pos
        @team=team
        if @team=="W"
            @symbol="\u265A" #U+265F
        else
            @symbol="\u2654"
        end
        @valid_moves=[]
    end

    def update_valid_moves(board_state)
        @valid_moves=[]
        @invalid_moves=[]
        row=@current_pos[0]
        col=@current_pos[1]

        #1 row
        3.times do |time|
            nRow=row-1
            nCol=col-1+time
            valid=true
            board_state.each do |row|
                row.each do |piece|
                    if piece !=nil && piece.team!=@team
                        piece.valid_moves.each do |move|
                            #p "#{move} , our pos : #{[nRow,nCol]}"
                            if move==[nRow,nCol]
                                valid=false
                            end
                        end
                    elsif piece !=nil && piece.team==@team
                        valid=false
                    end
                end
            end
            if valid==true
                @valid_moves<<[nRow,nCol]
            end
        end
        #2 bot row
        3.times do |time|
            nRow=row+1
            nCol=col-1+time
            valid=true
            board_state.each do |row|
                row.each do |piece|
                    if piece !=nil && piece.team!=@team
                        piece.valid_moves.each do |move|
                            #p "#{move} , our pos : #{[nRow,nCol]}"
                            if move==[nRow,nCol]
                                valid=false
                            end
                        end
                    elsif piece !=nil && piece.team==@team
                        valid=false
                    end
                end
            end
            if valid==true
                @valid_moves<<[nRow,nCol]
            end
        end
        # left
            nRow=row
            nCol=col-1
            valid=true
            board_state.each do |row|
                row.each do |piece|
                    if piece !=nil && piece.team!=@team
                        piece.valid_moves.each do |move|
                            #p "#{move} , our pos : #{[nRow,nCol]}"
                            if move==[nRow,nCol]
                                valid=false
                            end
                        end
                    elsif piece !=nil && piece.team==@team
                        valid=false
                    end
                end
            end
            if valid==true
                @valid_moves<<[nRow,nCol]
            end

        #right
        nRow=row
            nCol=col+1
            valid=true
            board_state.each do |row|
                row.each do |piece|
                    if piece !=nil && piece.team!=@team
                        piece.valid_moves.each do |move|
                            #p "#{move} , our pos : #{[nRow,nCol]}"
                            if move==[nRow,nCol]
                                valid=false
                            end
                        end
                    elsif piece !=nil && piece.team==@team
                        valid=false
                    end
                end
            end
            if valid==true
                @valid_moves<<[nRow,nCol]
            end
    end

    def get_piece(pos,board_state)
        return board_state[pos[0]][pos[1]]
    end
    def update_pos(pos)
        @current_pos=pos
    end
end
