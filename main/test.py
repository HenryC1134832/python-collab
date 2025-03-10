def find_max(nums):
    max_num = float("-inf") # smaller than all other numbers
    for num in nums:
        if num > max_num:
            max = num           # (Fill in the missing line here)
    return max_num

#print(find_max(30))