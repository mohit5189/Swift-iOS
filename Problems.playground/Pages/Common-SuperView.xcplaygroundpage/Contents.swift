import UIKit
class MainView: UIView {
    
}

func common(_ view1: UIView, _ view2: UIView) {
    var superViews = [UIView]()
    var firstView = view1
    var secondView = view2
    while firstView != nil {
        superViews.append(firstView)
        firstView = firstView.superView
    }
    
    while secondView != nil {
        if superViews.contains(secondView) {
            print(secondView.frame)
            break
        }
        secondView = secondView.superView
    }
    
}

var superView = MainView()
superView.frame = CGRect(x: 44, y: 44, width: 44, height: 44)
var view1 = UIView()
superView.addSubview(UIView().addSubview(UIView()).addSubview(view1))

var view2 = UIView()
superView.addSubview(UIView().addSubview(view2))


