
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
  var dict: [Int: Int] = [:]
  
  for (index, number) in nums.enumerated() {
    let requiredNumber = target - number
    
    if let requiredIndex = dict[requiredNumber] {
      return [requiredIndex, index]
    }
    
    dict[number] = index
  }
  
  return []
}


let numbers = [2, 7, 11, 15]
let target = 9
let result = twoSum(numbers, target)
print(result)

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
