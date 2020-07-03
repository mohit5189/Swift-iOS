// Timer example

class A {
    
    func startTimer() {
        NSTimer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    deinit {
        print("class deinit")
    }
}
