import UIKit

protocol AnyView: class {
    var view: UIView { get }
}

extension AnyView where Self: UIView {
    var view: UIView { return self }
}
