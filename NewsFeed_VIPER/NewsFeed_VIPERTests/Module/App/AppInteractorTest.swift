import XCTest
import Swinject
import Cuckoo
@testable import Lalamove

final class AppInteractorTest: XCTestCase {

    private var container: Container!
    private var interactor: AppInteractor!

    override func setUp() {
        super.setUp()

        // Setup Mock dependency injection
        container = Container()
        container.autoregister(AppInteractorProtocol.self, initializer: AppInteractor.init)

        /* Please Add AppInteractor's dependency here.
        * If AppInteractor's constructor requires an injected Protocol: init(eventService: EventTrackerProtocol)
        * Please add: container.autoregister(EventTrackerProtocol.self, initializer: MockEventTrackerProtocol.init).inObjectScope(.container)
        */

        interactor = container.resolve(AppInteractorProtocol.self) as? AppInteractor
    }

    override func tearDown() {
        // Clean up all injected mock objects
        container.resetObjectScope(ObjectScope.container)
        super.tearDown()
    }

    func testAppInteractorInit() {
        XCTAssertNotNil(interactor)
    }

    // Please add tests for AppInteractorProtocol's functions
}
