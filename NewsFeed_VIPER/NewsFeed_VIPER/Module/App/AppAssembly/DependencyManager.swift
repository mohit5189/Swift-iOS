import Swinject

final class DependencyManager {
    var assembler: Assembler

    var resolver: Resolver { return assembler.resolver }

    static let shared = DependencyManager()

    private init() {
        assembler = Assembler([
            NewsListDIAssembly(),
            ServiceAssembly(),
        ])
    }
}
