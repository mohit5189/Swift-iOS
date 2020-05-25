import UIKit

protocol AppPresenterProtocol: AnyObject {

}

final class AppViewController: UIViewController {
    private let moduleView: AppViewProtocol
    private let interactor: AppInteractorProtocol
    private let router: AppRouterProtocol

    init(view: AppViewProtocol, interactor: AppInteractorProtocol, router: AppRouterProtocol) {
        self.moduleView = view
        self.interactor = interactor
        self.router = router

        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = moduleView.view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppViewController: AppPresenterProtocol {

}
