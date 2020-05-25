import UIKit

typealias VoidHandler = () -> Void

protocol RouterProtocol: class {
    var sourceViewController: UIViewController? { get set }
    var closeCompletion: VoidHandler? { get set }
}

class Router: NSObject, RouterProtocol {
    weak var sourceViewController: UIViewController?
    var closeCompletion: VoidHandler?
}
