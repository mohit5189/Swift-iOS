// Timer example

NSTimer must be used with RunLoop because its timing tasks are triggered based on RunLoop, which uses the common Target-Action mode. Since RunLoop strongly references the timer, the timer will strongly reference the Target, which is easy to cause problems such as circular references and memory leaks.


class A {
    
    func startTimer() {
        NSTimer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    deinit {
        print("class deinit")
    }
}
