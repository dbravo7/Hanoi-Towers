require 'tower_h'

describe Game do 
  subject(:game) {Game.new}
  
  describe '#initialize' do 
    it 'assigns arr 1' do
      expect(game.arr_1).to eq([1, 1, 1, 1, 1])
    end 

    it 'assigns arr 2' do 
      expect(game.arr_2).to eq([2, 2, 2])
    end 

    it 'assigns arr 3' do
      expect(game.arr_3).to eq([3])
    end 

    it 'assigns empty array to variable move' do
      expect(game.coord).to eq([])
    end 

    it 'has hash variable tower that contains all three towers' do 
      expect(game.tower).to eq({
      1=>[game.arr_1, game.arr_2, game.arr_3], 
      2=>[],
      3=>[]
    })
    end 
  end 

  describe '#valid_move' do 
    it 'returns true if no error raised' do 
      expect(game.valid_move([1, 2])).to eq(true)
    end 

    it 'raises error if numbers are not from 1 to 3' do 
      expect { game.valid_move([10, 1]).to raise_error(ArgumentError) }
      expect { game.valid_move([nil, nil]).to raise_error(ArgumentError)}
    end 

    it 'raises error if tower has no tiles to move' do 
     expect { game.valid_move([2, 3]).to raise_error(ArgumentError) }
    end 
    
    it 'raises error if tower cannot receive the tile' do
      expect { game.valid_move([1, 1]).to raise_error(ArgumentError) }
    end 
  end 

  describe '#move' do 
    it 'allows moving to a blank space' do 
      expect { game.move([1, 2]) }.not_to raise_error 
    end 

    it 'allows moving onto a larger disk' do 
      game.move([1, 2])
      game.move([1, 3])
      expect { game.move([2, 3]) }.not_to raise_error
    end 
  end 
  
  describe '#won?' do 

    it "is not won at the start" do
      expect(game).not_to be_won
    end 

    it 'is won when all disks are moved to tower 3' do 
      game.move([1, 3])
      game.move([1, 2])
      game.move([3, 2])
      game.move([1, 3])
      game.move([2, 1])
      game.move([2, 3])
      game.move([1, 3])

      expect(game).to be_won
    end 
  end 
end 