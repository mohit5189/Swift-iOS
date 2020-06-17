// https://www.geeksforgeeks.org/zigzag-or-diagonal-traversal-of-matrix/
// The diagonal printing of a given matrix “matrix[ROW][COL]” always has “ROW + COL – 1” lines in output.

func printDiognal() {
var a: [[Int]] = [  [1,2,3,4],
                    [5,6,7,8],
                    [9,10,11,12],
                    [13,14,15,16]]
    
    
    var column = 0
    var row = 0
    
    // print untill row
    for i in 0...3 {
        row = i
        while column <= 3, row >= 0 {
            print(a[row][column])
            row -= 1
            column += 1
        }
        column = 0
    }
    
    // print until column finish
    for i in 1...3 {
        row = 3
        column = i
        
        while row >= 0, column <= 3 {
            print(a[row][column])
            row -= 1
            column += 1
        }
    }

}

printDiognal()
