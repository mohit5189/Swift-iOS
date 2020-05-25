import XCTest
import Swinject
import Cuckoo
@testable import Lalamove

final class AppAssemblyTest: XCTestCase {
    func testAppDIAssembly() {
        // Given DependencyConfigurator is setup to create Assembler with `AppDIAssembly`
        // When App Assembly set up a dependency
        let sharedResolver = DependencyConfigurator.shared.resolver

        // Then: the container should be able to resolve classes in App Module
        let moduleAssembly = sharedResolver.resolve(AppAssembly.self)!
        let view = sharedResolver.resolve(AppViewProtocol.self)!
        let interactor = sharedResolver.resolve(AppInteractorProtocol.self)!
        let router = sharedResolver.resolve(AppRouterProtocol.self)!
        XCTAssertNotNil(moduleAssembly)
        XCTAssertTrue(view is AppView)
        XCTAssertTrue(interactor is AppInteractor)
        XCTAssertTrue(router is AppRouter)
    }

    // MARK: Test creating connection between interactor, presenter & view
    func testAppAssembly() {
        var dummyInteractor: MockAppInteractorProtocol!
        var dummyView: MockAppViewProtocol!
        var dummyRouter: MockAppRouterProtocol!

        // Given an Assembly with mock dependency
        let dummyContainer = Container()
        dummyContainer.register(AppInteractorProtocol.self) { _ in
            dummyInteractor = MockAppInteractorProtocol()
            return dummyInteractor
        }
        dummyContainer.register(AppViewProtocol.self) { _ in
            dummyView = MockAppViewProtocol()
            stub(dummyView) { when($0.presenter.set(any())).thenDoNothing() }
            return dummyView
        }
        dummyContainer.register(AppRouterProtocol.self) { _ in
            let mockRouter = MockAppRouterProtocol()
            stub(mockRouter) {
                when($0.sourceViewController.set(any())).thenDoNothing()
                when($0.closeCompletion.set(any())).thenDoNothing()
            }
            dummyRouter = mockRouter
            return dummyRouter
        }

        let moduleAssembly = AppAssembly(resolver: dummyContainer)

        // When creating controller by the assembly's function
        let presenter = moduleAssembly.module()

        // Then: respective container factory blocks will fire
        XCTAssertTrue(presenter is AppViewController)
        XCTAssertNotNil(dummyInteractor)
        XCTAssertNotNil(dummyView)
        XCTAssertNotNil(dummyRouter)
        verify(dummyRouter).sourceViewController.set(ParameterMatcher<UIViewController?> { $0 === presenter })
        verify(dummyView).presenter.set(ParameterMatcher<AppPresenterProtocol?> { $0 as! AppViewController === presenter })
    }
}
