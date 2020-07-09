// https://www.hackingwithswift.com/articles/218/whats-new-in-swift-5-3

//======================

// 1. Multi-pattern catch clauses - can catch multiple exception in one catch

//======================


 do {
     let result = try checkReactorOperational()
     print("Result: \(result)")
 } catch TemperatureError.tooHot, TemperatureError.tooCold {
     print("Shut down the reactor!")
 } catch {
     print("An unknown error occurred.")
 }
 


//======================

// 2. Multiple Trailing Closure -  for swift UI

//======================

func travel(action: () -> Void, print: () -> Void) {
    print("I'm getting ready to go.")
}

//======================

// 3. Synthesized Comparable conformance for enums

//======================

enum Size: Comparable {
    case small
    case medium
    case large
    case extraLarge
}

let shirtSize = Size.small
let personSize = Size.large

if shirtSize < personSize {
    print("That shirt is too small")
}



// This synthesized conformance works great with associated values that are Comparable. For example, if we had an enum that described the football World Cup wins for a team, we might write this:

enum WorldCupResult: Comparable {
    case neverWon
    case winner(stars: Int)
}

let americanMen = WorldCupResult.neverWon
let americanWomen = WorldCupResult.winner(stars: 4)
let japaneseMen = WorldCupResult.neverWon
let japaneseWomen = WorldCupResult.winner(stars: 1)

let teams = [americanMen, americanWomen, japaneseMen, japaneseWomen]
let sortedByWins = teams.sorted()
print(sortedByWins)

// That will sort the array so that the two teams who haven’t won the World Cup come first, then the Japanese women’s team, then the American women’s team – it considers the two winner cases to be higher than the two neverWon cases, and considers winner(stars: 4) to be higher than winner(stars: 1).



//======================

// 4. self is no longer required in many places

//=======================

// No need of self to call from closure where no retain cycle

struct NewContentView: View {
    var body: some View {
        List(1..<5) { number in
            cell(for: number)
        }
    }

    func cell(for number: Int) -> some View {
        Text("Cell \(number)")
    }
}


//======================

// 5. Type-Based Program Entry Points

//=======================

@main
struct NewApp {
    static func main() {
        print("Running!")
    }
}

//======================

// 6. Where clause can be use on function now

//=======================

extension Stack {
    func sorted() -> [Element] where Element: Comparable {
        array.sorted()
    }
}



//======================

// 6. Refined didSet Semantics

//=======================

