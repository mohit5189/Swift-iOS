
protocol Vehicle {
    var companyName: String {get set}
    func getCompanyName() -> String
}

protocol Car: Vehicle {
    var carName: String {get set}
    func getCarModel() -> String
}

protocol Bike: Vehicle {
    var bikeName: String {get set}
    func getBikeModel() -> String
}

extension Bike {
    var bikeName: String { // Way to declare default value param
        get { return "Test" }
        set {}
    }
    func getBikeModel() -> String {
        return "Pulsur"
    }
}

class CarClass: Car {
    var carName: String
    var companyName: String
    
    init(carName: String, companyName: String) {
        self.carName = carName
        self.companyName = companyName
    }
    
    func getCarModel() -> String {
        return carName
    }
    
    func getCompanyName() -> String {
        return companyName
    }
}

class BikeClass: Bike {
    var companyName: String
    
    init(companyName: String) {
        self.companyName = companyName
    }
        
    func getCompanyName() -> String {
        return companyName
    }
}


var carObj: Car = CarClass(carName: "Baleno", companyName: "Maruti")
print(carObj.carName)
print(carObj.companyName)


var bikeObj: Bike = BikeClass(companyName: "Maruti")
print(bikeObj.bikeName)
print(bikeObj.companyName)


// Protocol with default value

protocol DefaultvalueProtocol {
    func test(a: Int)
}

extension DefaultvalueProtocol {
    func test(a: Int = 5) {
        test(a: a)
    }
}

class TestDefault: DefaultvalueProtocol {
    
}




