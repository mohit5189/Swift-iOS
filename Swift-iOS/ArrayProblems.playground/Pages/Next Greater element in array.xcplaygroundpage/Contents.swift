// https://www.geeksforgeeks.org/next-greater-element/

// One approach can be inner loop, here we check single loop solutionj


func nextGreater(_ arr: [Int]) {
    var stack: [Int] = [Int]()
    for num in arr {
        if stack.count > 0, stack.last! < num {
            while stack.count > 0, stack.last! < num {
                print("\(stack.last!) ---------> \(num)")
                stack.removeLast()
            }
            stack.append(num)
        } else {
            stack.append(num)
        }
    }
    
    while stack.count > 0 {
        print("\(stack.last!) ---------> -1")
        stack.removeLast()
    }
}

nextGreater([1,6,3,9])
