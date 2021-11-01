class Player
    attr_accessor :name
    attr_accessor :team
    attr_accessor :check

    def initialize(name,team)
        @name=name
        @team=team
        @check=false
    end

end