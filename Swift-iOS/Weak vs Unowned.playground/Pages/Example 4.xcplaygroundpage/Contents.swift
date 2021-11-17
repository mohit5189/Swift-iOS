/**
 Output :

 Customer init called
 Card init called


 Note - Card deinit won't call since we holding strong reference of Card

 if we also call for customer?.card = nil along with card = nil, then card deinit will be called. NOTE_ WE NEED TO SET LOCAL VARIABLE AND CLASS VARIABLE BOTH NIL
 */

class Customer {
    var card: Card?

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
var card: Card? = Card(customer!)
customer?.card = card
card = nil
//customer?.card = nil
