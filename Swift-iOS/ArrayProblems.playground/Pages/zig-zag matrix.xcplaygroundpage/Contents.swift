
func printZigZag() {
var a: [[Int]] = [[1,2,3,4],
                    [5,6,7,8],
                    [9,10,11,12],
                    [13,14,15,16]]
    
    var row = 0
    
    while row < 4 {
        if row % 2 != 0 {
            for i in stride(from: 3, to: -1, by: -1) {
                print(a[row][i])
            }
        } else {
            for i in 0..<4 {
                print(a[row][i])
            }
        }
        row += 1
    }

}

printZigZag()
