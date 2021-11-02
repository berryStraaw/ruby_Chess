require_relative 'board'

puts "would you like to load a game file? y/n"
if gets.chomp=="y"
    game=Board.load()
    game.display()
else
   game=Board.new 
end

game.play()
