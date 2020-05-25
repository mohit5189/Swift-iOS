import XCTest
import Swinject
import Cuckoo
@testable import Lalamove

final class NewsListViewControllerTest: XCTestCase {
    private var container: Container!
    private var viewController: NewsListViewController!

    private var mockView: MockNewsListViewProtocol!
    private var mockInteractor: MockNewsListInteractorProtocol!
    private var mockRouter: MockNewsListRouterProtocol!

    override func setUp() {
        super.setUp()

        container = Container()
        container.autoregister(NewsListViewProtocol.self, initializer: MockNewsListViewProtocol.init).inObjectScope(.container)
        container.autoregister(NewsListInteractorProtocol.self, initializer: MockNewsListInteractorProtocol.init).inObjectScope(.container)
        container.autoregister(NewsListRouterProtocol.self, initializer: MockNewsListRouterProtocol.init).inObjectScope(.container)

        container.autoregister(NewsListViewController.self, initializer: NewsListViewController.init).inObjectScope(.container)

        viewController = container.resolve(NewsListViewController.self)

        mockView = container.resolve(NewsListViewProtocol.self) as? MockNewsListViewProtocol
        mockInteractor = container.resolve(NewsListInteractorProtocol.self) as? MockNewsListInteractorProtocol
        mockRouter = container.resolve(NewsListRouterProtocol.self) as? MockNewsListRouterProtocol
    }

    override func tearDown() {
        container.resetObjectScope(ObjectScope.container)
        container = nil
        super.tearDown()
    }

    func testInit() {
        XCTAssertNotNil(viewController, "controller to test should not be nil")
    }

    // Please add tests for NewsListViewController's functions
}
