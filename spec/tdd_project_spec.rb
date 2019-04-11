require 'tdd_project'

describe Array do 
  subject(:arr) {Array.new([1,2,1,3,3])}

  describe '#my_uniq' do
    it 'takes in array and returns new array without duplicates' do
      expect(arr.my_uniq(arr)).to eq([1,2,3])
    end 
  end 

  describe '#two_sum' do   
    subject(:arr) {Array.new([-1, 0, 2, -2, 1])}

    it 'returns 2D-array of pairs in ascending order whose elements sum to zero' do
      expect(arr.two_sum(arr)).to eq([[0, 4], [2, 3]])
    end 
  end 

  describe '#my_transpose' do 
    subject(:arr) {Array.new([[0, 3, 6], [1, 4, 7], [2, 5, 8]])}

    it 'transposes numbers in columns to rows' do 
      expect(arr.my_transpose(arr)).to eq([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
    end 
  end 

  describe '#stock_picker' do 
    subject(:arr) {Array.new}

    it 'outputs most profitable pair of days to buy/sell stock' do 
      expect(arr.stock_picker([4, 5, 9 ,10 ,16, 3, 8, 1])).to eq([0, 4])
      expect(arr.stock_picker([16, 5, 9, 10, 3, 8, 1])).to eq([1, 3])
    end 
  end 

end 


