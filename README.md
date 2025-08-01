# Two Sum Problem Solution in Swift

## Problem Statement
Given an array of integers `nums` and an integer `target`, return the indices of the two numbers such that they add up to `target`. You may assume that each input has exactly one solution, and you may not use the same element twice. The answer can be returned in any order.

**Example:**
```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: nums[0] + nums[1] = 2 + 7 = 9
```

## Solution Approach
We use a hash map (dictionary in Swift) to solve this problem efficiently in O(n) time complexity. The idea is to:
1. Iterate through the array once.
2. For each number, calculate its complement (target - current number).
3. Check if the complement exists in the hash map.
4. If found, return the current index and the complement's index.
5. If not found, store the current number and its index in the hash map.

This approach is more efficient than the brute force method (checking all pairs, which would be O(n²)).

## Swift Implementation

```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numDict: [Int: Int] = [:]
    
    for (index, num) in nums.enumerated() {
        let complement = target - num
        
        if let complementIndex = numDict[complement] {
            return [complementIndex, index]
        }
        
        numDict[num] = index
    }
    
    return []
}
```

## Code Explanation
- **Function Signature**: `func twoSum(_ nums: [Int], _ target: Int) -> [Int]` takes an array of integers and a target integer, returning an array of two indices.
- **Hash Map**: `var numDict: [Int: Int] = [:]` creates an empty dictionary to store numbers as keys and their indices as values.
- **Loop**: `for (index, num) in nums.enumerated()` iterates through the array with both index and value.
- **Complement Check**: `let complement = target - num` calculates the number needed to reach the target.
- **Result Check**: `if let complementIndex = numDict[complement]` checks if the complement exists in the dictionary.
- **Return Result**: If found, returns `[complementIndex, index]`.
- **Store Number**: If not found, `numDict[num] = index` stores the current number and its index.
- **Default Return**: Returns an empty array `[]` if no solution is found (though the problem guarantees a solution).

## Time and Space Complexity
- **Time Complexity**: O(n), where n is the length of the input array, as we only need one pass through the array.
- **Space Complexity**: O(n) to store up to n elements in the hash map.

## Test Cases
The solution has been tested with the following cases to ensure robustness:
1. **Basic Case**: `nums = [2, 7, 11, 15], target = 9` → Output: `[0, 1]` (2 + 7 = 9).
2. **Negative Numbers**: `nums = [-3, 4, 3, 90], target = 0` → Output: `[0, 2]` (-3 + 3 = 0).
3. **Duplicate Numbers**: `nums = [3, 3], target = 6` → Output: `[0, 1]` (3 + 3 = 6).
4. **Large Numbers**: `nums = [1000000, 2000000], target = 3000000` → Output: `[0, 1]` (1000000 + 2000000 = 3000000).
5. **Sparse Solution**: `nums = [2, 1, 5, 3, 7], target = 9` → Output: `[0, 4]` (2 + 7 = 9).
6. **Minimum Array Length**: `nums = [1, 2], target = 3` → Output: `[0, 1]` (1 + 2 = 3).
7. **Zero Values**: `nums = [0, 4, 3, 0], target = 0` → Output: `[0, 3]` (0 + 0 = 0).

## Test Suite
Below is a Swift test suite to verify the solution:

```swift
func runTwoSumTests() {
    // Test Case 1: Basic Case
    let test1 = twoSum([2, 7, 11, 15], 9)
    assert(test1 == [0, 1] || test1 == [1, 0], "Test 1 failed: Expected [0, 1], got \(test1)")
    
    // Test Case 2: Negative Numbers
    let test2 = twoSum([-3, 4, 3, 90], 0)
    assert(test2 == [0, 2] || test2 == [2, 0], "Test 2 failed: Expected [0, 2], got \(test2)")
    
    // Test Case 3: Duplicate Numbers
    let test3 = twoSum([3, 3], 6)
    assert(test3 == [0, 1] || test3 == [1, 0], "Test 3 failed: Expected [0, 1], got \(test3)")
    
    // Test Case 4: Large Numbers
    let test4 = twoSum([1000000, 2000000], 3000000)
    assert(test4 == [0, 1] || test4 == [1, 0], "Test 4 failed: Expected [0, 1], got \(test4)")
    
    // Test Case 5: Sparse Solution
    let test5 = twoSum([2, 1, 5, 3, 7], 9)
    assert(test5 == [0, 4] || test5 == [4, 0], "Test 5 failed: Expected [0, 4], got \(test5)")
    
    // Test Case 6: Minimum Array Length
    let test6 = twoSum([1, 2], 3)
    assert(test6 == [0, 1] || test6 == [1, 0], "Test 6 failed: Expected [0, 1], got \(test6)")
    
    // Test Case 7: Zero Values
    let test7 = twoSum([0, 4, 3, 0], 0)
    assert(test7 == [0, 3] || test7 == [3, 0], "Test 7 failed: Expected [0, 3], got \(test7)")
    
    print("All tests passed!")
}

// Run the tests
runTwoSumTests()
```

## Example Usage
```swift
let numbers = [2, 7, 11, 15]
let target = 9
let result = twoSum(numbers, target)
print(result) // Output: [0, 1]
```

## Conclusion
The solution is robust, efficient, and handles all relevant test cases, including edge cases like negative numbers, duplicates, large numbers, and zeros. The test suite confirms correctness across these scenarios, ensuring the implementation meets the problem’s requirements.
