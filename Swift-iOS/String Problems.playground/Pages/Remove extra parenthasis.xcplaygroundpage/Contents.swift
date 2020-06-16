// remove extra parenthasis "((())" -> "(())", ")(a)()" -> (a)()
func removeExtraParenthasis(_ value: inout String) -> String {
    var stack = [String.Index]()
    for index in value.indices {
        if value[index] == "(" {
            stack.append(index)
        } else if value[index] == ")" {
            if stack.count == 0 || value[stack.last!] == ")"{ // close bracket should remove in this case
                print("insert )")
                stack.append(index)
            } else {
                print("pop (")
                stack.removeLast()
            }
        }
    }
    return value.removeCharacters(at: stack)
}

extension String.Index {
  func distance<S: StringProtocol>(in string: S) -> Int { string.distance(from: string.startIndex, to: self) }
}
extension String {
  mutating func removeCharacters(at indexs: [String.Index]) -> String {
    var offSet = 0
    for item in indexs.map({ $0.distance(in: self) }) {
      remove(at: index(startIndex, offsetBy: item - offSet))
      offSet += 1
    }
    return self
  }
}
