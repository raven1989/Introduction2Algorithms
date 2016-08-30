#!/usr/bin/ruby

#和最大子数组的分治解法，三种情况
#1.最大子数组在左边
#2.最大子数组在右边
#3.最大子数组在中间，这种情况下最大的必然是
#  左边最大+右边最大+两者中间的数
def maxsumSubarray(nums)
  return divideAndConquer nums, 0, nums.size-1
end

def divideAndConquer(nums, left, right)
  if left>=right then
    return left,right,nums[right]
  end
  mid = left+(right-left)/2
  luy, lell, lax = divideAndConquer(nums, left, mid)
  ruy, rell, rax = divideAndConquer(nums, mid+1, right)
  miax = lax + rax
  i = lell+1
  while i<ruy do
    miax += nums[i]
    i += 1
  end
  if miax>lax and miax>rax then
    return luy,rell,miax
  elsif lax>rax then
    return luy,lell,lax
  else
    return ruy.rell,rax
  end
end

#用和最大子数组问题求解BeatStocks问题
def beatStocks(nums)
  diff = []
  (0...nums.size-1).each{ |i| 
    diff[i] = nums[i+1]-nums[i]
  }
  buy, sell, max = maxsumSubarray diff
  return buy, sell+1, max
end

[
  [5, -1, 5],
  [5,-6,2],
  [-1,-3,-2],
].each { |x| 
  puts "#{x} maxsumSubarray #{maxsumSubarray x}"
}

[
  [2,7,1,3],
  [7,6,3,1],
].each { |x| 
  puts "#{x} beatStocks #{beatStocks x}"
}
