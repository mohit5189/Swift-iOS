import UIKit
import Swinject
import SwinjectAutoregistration

final class NewsListAssembly {
    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func module(closeCompletion: VoidHandler? = nil) -> UIViewController {
        let view = resolver.resolve(NewsListViewProtocol.self)!
        let interactor = resolver.resolve(NewsListInteractorProtocol.self)!
        let router = resolver.resolve(NewsListRouterProtocol.self)!

        let controller = NewsListViewController(view: view, interactor: interactor, router: router)

        router.sourceViewController = controller
        router.closeCompletion = closeCompletion

        view.presenter = controller

        return controller
    }
}

final class NewsListDIAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NewsListAssembly.self) { NewsListAssembly(resolver: $0) }
        container.autoregister(NewsListViewProtocol.self, initializer: NewsListView.init)
        container.autoregister(NewsListInteractorProtocol.self, initializer: NewsListInteractor.init)
        container.autoregister(NewsListRouterProtocol.self, initializer: NewsListRouter.init)
    }
}
