import XCTest
import Swinject
import Cuckoo
@testable import Lalamove

final class AppViewControllerTest: XCTestCase {
    private var container: Container!
    private var viewController: AppViewController!

    private var mockView: MockAppViewProtocol!
    private var mockInteractor: MockAppInteractorProtocol!
    private var mockRouter: MockAppRouterProtocol!

    override func setUp() {
        super.setUp()

        container = Container()
        container.autoregister(AppViewProtocol.self, initializer: MockAppViewProtocol.init).inObjectScope(.container)
        container.autoregister(AppInteractorProtocol.self, initializer: MockAppInteractorProtocol.init).inObjectScope(.container)
        container.autoregister(AppRouterProtocol.self, initializer: MockAppRouterProtocol.init).inObjectScope(.container)

        container.autoregister(AppViewController.self, initializer: AppViewController.init).inObjectScope(.container)

        viewController = container.resolve(AppViewController.self)

        mockView = container.resolve(AppViewProtocol.self) as? MockAppViewProtocol
        mockInteractor = container.resolve(AppInteractorProtocol.self) as? MockAppInteractorProtocol
        mockRouter = container.resolve(AppRouterProtocol.self) as? MockAppRouterProtocol
    }

    override func tearDown() {
        container.resetObjectScope(ObjectScope.container)
        container = nil
        super.tearDown()
    }

    func testInit() {
        XCTAssertNotNil(viewController, "controller to test should not be nil")
    }

    // Please add tests for AppViewController's functions
}
