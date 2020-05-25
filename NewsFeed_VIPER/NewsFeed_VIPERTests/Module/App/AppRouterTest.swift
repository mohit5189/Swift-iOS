import XCTest
import UIKit
@testable import Lalamove

final class AppRouterTest: XCTestCase {

    private var router: AppRouter!
    private var spyNavigationController: UINavigationControllerMock!

    private var existingRootVC: UIViewController!

    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        let dummyViewController = UIViewController()
        spyNavigationController = UINavigationControllerMock(rootViewController: dummyViewController)

        existingRootVC = UIApplication.shared.keyWindow?.rootViewController
        UIApplication.shared.keyWindow?.rootViewController = spyNavigationController

        router = AppRouter()
        router.sourceViewController = dummyViewController
    }

    override func tearDown() {
        UIView.setAnimationsEnabled(true)
        UIApplication.shared.keyWindow?.rootViewController = existingRootVC
        super.tearDown()
    }

    // Please add tests for AppRouterProtocol's functions
}
