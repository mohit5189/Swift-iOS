import UIKit

protocol NewsListPresenterProtocol: AnyObject {

}

final class NewsListViewController: UIViewController {
    private let moduleView: NewsListViewProtocol
    private let interactor: NewsListInteractorProtocol
    private let router: NewsListRouterProtocol

    init(view: NewsListViewProtocol, interactor: NewsListInteractorProtocol, router: NewsListRouterProtocol) {
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

extension NewsListViewController: NewsListPresenterProtocol {

}
