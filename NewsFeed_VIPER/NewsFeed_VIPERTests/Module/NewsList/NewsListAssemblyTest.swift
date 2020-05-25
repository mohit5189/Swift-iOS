import XCTest
import Swinject
import Cuckoo
@testable import Lalamove

final class NewsListAssemblyTest: XCTestCase {
    func testNewsListDIAssembly() {
        // Given DependencyConfigurator is setup to create Assembler with `NewsListDIAssembly`
        // When App Assembly set up a dependency
        let sharedResolver = DependencyConfigurator.shared.resolver

        // Then: the container should be able to resolve classes in NewsList Module
        let moduleAssembly = sharedResolver.resolve(NewsListAssembly.self)!
        let view = sharedResolver.resolve(NewsListViewProtocol.self)!
        let interactor = sharedResolver.resolve(NewsListInteractorProtocol.self)!
        let router = sharedResolver.resolve(NewsListRouterProtocol.self)!
        XCTAssertNotNil(moduleAssembly)
        XCTAssertTrue(view is NewsListView)
        XCTAssertTrue(interactor is NewsListInteractor)
        XCTAssertTrue(router is NewsListRouter)
    }

    // MARK: Test creating connection between interactor, presenter & view
    func testNewsListAssembly() {
        var dummyInteractor: MockNewsListInteractorProtocol!
        var dummyView: MockNewsListViewProtocol!
        var dummyRouter: MockNewsListRouterProtocol!

        // Given an Assembly with mock dependency
        let dummyContainer = Container()
        dummyContainer.register(NewsListInteractorProtocol.self) { _ in
            dummyInteractor = MockNewsListInteractorProtocol()
            return dummyInteractor
        }
        dummyContainer.register(NewsListViewProtocol.self) { _ in
            dummyView = MockNewsListViewProtocol()
            stub(dummyView) { when($0.presenter.set(any())).thenDoNothing() }
            return dummyView
        }
        dummyContainer.register(NewsListRouterProtocol.self) { _ in
            let mockRouter = MockNewsListRouterProtocol()
            stub(mockRouter) {
                when($0.sourceViewController.set(any())).thenDoNothing()
                when($0.closeCompletion.set(any())).thenDoNothing()
            }
            dummyRouter = mockRouter
            return dummyRouter
        }

        let moduleAssembly = NewsListAssembly(resolver: dummyContainer)

        // When creating controller by the assembly's function
        let presenter = moduleAssembly.module()

        // Then: respective container factory blocks will fire
        XCTAssertTrue(presenter is NewsListViewController)
        XCTAssertNotNil(dummyInteractor)
        XCTAssertNotNil(dummyView)
        XCTAssertNotNil(dummyRouter)
        verify(dummyRouter).sourceViewController.set(ParameterMatcher<UIViewController?> { $0 === presenter })
        verify(dummyView).presenter.set(ParameterMatcher<NewsListPresenterProtocol?> { $0 as! NewsListViewController === presenter })
    }
}
