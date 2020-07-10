
/*
 class TestView: UIView {

     override func layoutSubviews() {
         print("layout subview called")
     }
     
     @IBAction func buttonClicked(_ sender: UIButton) {
         if sender.tag == 0 {
             sender.tag = 1
             for constraint in self.constraints {
                 if constraint.identifier == "height" {
                    constraint.constant = 100
                 }
             }

         } else {
             sender.tag = 0
             for constraint in self.constraints {
                 if constraint.identifier == "height" {
                    constraint.constant = 246
                 }
             }
         }
         
         print(self.frame.height)
     }
 }

 */

// Look at above example, we set height to some value then print frame. It has following cases:

1. It will print not updated frame, because frame update only when layoutSubviews called (called automatically)
2. We can get actual frame in layoutSubviews
3. If we want frame at same time while update:
layoutIfNeeded() -> call this to force update, its immidiate, layoutSubviews will be called just after this
setNeedLayout() -> ask for update layout, but put in main runloop of app, so not immidiate
