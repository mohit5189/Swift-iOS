
import UIKit

/*
 // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.
 open func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell?

 // newer dequeue method guarantees a cell is returned and resized properly, assuming identifier is registered
 @available(iOS 6.0, *)
 open func dequeueReusableCell(withIdentifier identifier: String,
                               for indexPath: IndexPath) -> UITableViewCell

 */

struct CellQueue<T> {
    var cellArray: [T] = [T]()
    
    func appendCell(elem: T) {
        cellArray.append(elem)
    }
    
    func popCell() -> T {
        return cellArray.Last()
    }
}

class UITableView: UIScrollView {
    var cellMap = [String, CellQueue<UITableViewCell>] ()
    
    func dequeueReusableCell(withIdentifier identifier: String,
                             for indexPath: IndexPath) -> UITableViewCell {
        guard let cellQueue = cellMap[identifier] else {
          fatalError("No UITableViewCell is registered for this identifier")
        }
        
        return cellQueue.popCell()

    }
}
