
// https://medium.com/flawless-app-stories/unowned-vs-weak-614ac71ac516

/**
 1. Weak should always be optional, if not compiler will give error
 2. Unowned is faster and allows for immutability and non-optionality

 Example 1: Output:

 Customer init called
 Card init called
 Customer deinit called
 Card deinit called

 Explanation:

 in this example we keep Strong reference of Card in customer, So once we set customer as Nil, It will first deinit Customer and then Card since we holding unowned reference of Customer
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
customer?.card = Card(customer!)
customer = nil
