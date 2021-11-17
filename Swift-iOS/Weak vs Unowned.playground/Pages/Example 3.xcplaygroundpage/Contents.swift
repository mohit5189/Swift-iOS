/**
 Output :

 Customer init called
 Card init called
 Card deinit called


 Note - Card deinit is called as explained in Example 2
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
