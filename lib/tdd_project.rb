class Array

  def my_uniq(arr)
    no_duplicates = []
    
    arr.each do |num|
      if !no_duplicates.include?(num)
        no_duplicates << num
      end 
    end 
    no_duplicates
  end 

  def two_sum(arr)
    sum_to_zero = []
    arr.each_with_index do |num, idx|
      arr.each_with_index do |num2, idx2|
        if idx2 > idx && num + num2 == 0
          sum_to_zero << [idx, idx2]
        end 
      end 
    end 
    sum_to_zero
  end 

  def my_transpose(arr)
    arr.transpose
  end 

  def stock_picker(arr)
    days = []
    i = 0
    sum = 0
    while i < arr.length
      arr.each_with_index do |num, idx|
        if idx > i && num - arr[i] > sum
          sum = num - arr[i]
          days.unshift([i, idx])
        end 
      end 
      i += 1
    end 
    days[0]
  end 

end 
