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
      2=>[[], [], []], 
      3=>[[], [], []] 
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
    spacing_1 = {1=>spaces(tower[1]}
    spacing_2 = spaces(tower[2])
    spacing_3 = spaces(tower[3])
debugger 
    system("clear")
    puts "#{spacing_1[2].join}" + "   #{spacing_2[2].join}" + "   #{spacing_3[2].join}" 
    puts "#{spacing_1[1].join}" + "   #{spacing_2[1].join}" + "   #{spacing_3[1].join}"       
    puts "#{spacing_1[0].join}" + "   #{spacing_2[0].join}" + "   #{spacing_3[0].join}"  
    puts     "Tower 1"  + "      " + "Tower 2" + "          " + "Tower 3"
   end 

  def spaces(arr)
    # debugger 
    spaced_arr = []
    arr.each_with_index do |level, idx|
      space = []
      if level != arr_1
        # debugger
        num = (arr_1.length - level.length) 
        num.times {space << " "}
        split = space.length / 2
        spaced_arr << space[0...split] + level + space[split..-1]
      else 
        spaced_arr << level
      end 
    end
    spaced_arr
  end 

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
    # @tower[arr[0]].push([])
  end 
    
  def won?
    stack = tower[3]
    stack[0] == arr_1 && stack[1] == arr_2 && stack[2] == arr_3 
  end 

end 

if $PROGRAM_NAME == __FILE__
	Game.new
end 