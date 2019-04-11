require 'byebug'
class Game
  attr_reader :arr_1, :arr_2, :arr_3
  attr_accessor :tower, :coord

  def initialize
    @arr_1 = [1, 1, 1, 1, 1]
    @arr_2 = [2, 2, 2]
    @arr_3 = [3]
    @coord = []
    @tower = {
      1=>[arr_1, arr_2, arr_3], 
      2=>[], 
      3=>[] 
    }
    play
  end 

  def play 
    until won? 
      begin
        render
        prompt
        valid_move(@coord)
        move(@coord)
      rescue ArgumentError=> e
        puts "Error: #{e}"
        sleep(2)
        retry 
      end
    end 
    puts "You won. Good job!"
  end 

  def render 
    # Rendering needs some serious work 
    # spacing_1 = {1=>spaces(tower[1][0]), 2=>spaces(tower[1][1]), 3=>spaces(tower[2][2])}
    # spacing_2 = {1=>spaces(tower[2][0]), 2=>spaces(tower[2][1]), 3=>spaces(tower[2][2])}
    # spacing_3 = {1=>spaces(tower[3][0]), 2=>spaces(tower[3][1]), 3=>spaces(tower[3][2])}
debugger 
    system("clear")
    puts "#{tower[1][2]}" + "   #{tower[2][2]}" + "   #{tower[3][2]}" 
    puts "#{tower[1][1]}" + "   #{tower[2][1]}" + "   #{tower[3][1]}"       
    puts "#{tower[1][0]}" + "   #{tower[2][0]}" + "   #{tower[3][0]}"  
    puts     "Tower 1"  + "      " + "Tower 2" + "          " + "Tower 3"
   end 

  # def spaces(arr)
  #   space = []
  #   if arr != arr_1
  #     # debugger
  #     num = (arr_1.length - arr.length) 
  #     num.times {space << " "}
  #     split = space.length / 2
  #     return space[0...split] + arr + space[split..-1]
  #   end 
  #   arr
  # end 

  def prompt
    puts "Choose the top tile that you would like to move."
    puts "Choose tower: 1, 2, 3"
      top_of_tower = parse(gets.chomp)
    puts "Choose where you would like to move this tile"
      moved_to = parse(gets.chomp)
      @coord = [top_of_tower, moved_to]
  end 

  def parse(str)
    if ("1".."3").include?(str)
      return str.to_i
    else 
      raise ArgumentError.new "Please choose a tower number: 1 or 2 or 3"
      prompt 
    end 
  end 

  def valid_move(arr)
    arr.each do |int|
      if !(1..3).include?(int)  
        raise ArgumentError.new "Please choose a tower number: 1 or 2 or 3"
      elsif empty_tower?(tower[arr[0]])
        raise ArgumentError.new "There are no tiles to move here"
      elsif !empty_tower?(tower[arr[1]]) && tower[arr[1]].last.length < tower[arr[0]].last.length
        raise ArgumentError.new "Cannot place a tile on top of one that is smaller"
      end
    end  
    true 
  end 

  def empty_tower?(arr)
    arr.all? {|level| level.empty?}
  end 

  def move(arr)
    tile = tower[arr[0]].pop
    @tower[arr[1]].pop
    @tower[arr[1]].push(tile)
  end 
    
  def won?
    stack = tower[3]
    stack[0] == arr_1 && stack[1] == arr_2 && stack[2] == arr_3 
  end 

end 

if $PROGRAM_NAME == __FILE__
	Game.new
end 