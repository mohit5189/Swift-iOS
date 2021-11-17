/**
 Output :

 Customer init called
 Card init called
 Card deinit called
 Customer deinit called


 Note - card deinit called first because we take it weak, so it will be deinit even if we not set customer = nil
 */

class Customer {
    weak var card: Card?

    init() {
        print("Customer init called")
    }

    deinit {
        print("Customer deinit called")
    }
}

class Card {
    unowned var customer: Customer

    init(_ customer: Customer) {
        self.customer = customer
        print("Card init called")
    }

    deinit {
        print("Card deinit called")
    }
}

var customer: Customer? = Customer()
customer?.card = Card(customer!)
customer = nil
