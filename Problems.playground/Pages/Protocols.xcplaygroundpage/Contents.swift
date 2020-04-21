protocol Indentifiable {
    associatedtype ID
    func indentifier() -> ID
}

protocol PersonProtocol: Indentifiable {
    var name: String { get }
    var age: Int { get }
}

struct Person: PersonProtocol {
    let name: String
    let age: Int
    func indentifier() -> String {
        return "\(name)_\(age)"
    }
}

struct Car <T: PersonProtocol> where T.ID == String {
    let owner: T
    init(owner: T) {
        self.owner = owner
    }
    
    func getID() -> String {
        return owner.indentifier()
    }
}


protocol TableViewModelProtocol {
    associatedtype CellItem
    func getItem(at indexPath: indexPath) -> CellItem
}


protocol RandomViewModelProtocol: TableViewModelProtocol{
    
}

class RandomViewModel: RandomViewModelProtocol {
    func getItem(at indexPath: indexPath) -> String {
        return ""
    }
}

class RandomViewModelController<T: RandomViewModelProtocol> where T.CellItem == String {
    
    let viewModel: T
    init(viewModel: viewModel) {
        self.viewModel = viewModel
    }
    
    func cellForRow(at indexPath: IndexPath) -> UITavleViewcell {
        viewModel.getItem()
    }
}

