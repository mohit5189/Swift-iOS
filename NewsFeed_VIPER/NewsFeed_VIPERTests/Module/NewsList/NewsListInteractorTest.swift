import XCTest
import Swinject
import Cuckoo
@testable import NewsFeed_VIPER

final class NewsListInteractorTest: XCTestCase {

    private var container: Container!
    private var interactor: NewsListInteractor!

    override func setUp() {
        super.setUp()

        // Setup Mock dependency injection
        container = Container()
        container.autoregister(NewsListInteractorProtocol.self, initializer: NewsListInteractor.init)

        /* Please Add NewsListInteractor's dependency here.
        * If NewsListInteractor's constructor requires an injected Protocol: init(eventService: EventTrackerProtocol)
        * Please add: container.autoregister(EventTrackerProtocol.self, initializer: MockEventTrackerProtocol.init).inObjectScope(.container)
        */

        interactor = container.resolve(NewsListInteractorProtocol.self) as? NewsListInteractor
    }

    override func tearDown() {
        // Clean up all injected mock objects
        container.resetObjectScope(ObjectScope.container)
        super.tearDown()
    }

    func testNewsListInteractorInit() {
        XCTAssertNotNil(interactor)
    }

    // Please add tests for NewsListInteractorProtocol's functions
}
