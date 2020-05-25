import UIKit

protocol NewsListViewProtocol: AnyView {
    var presenter: NewsListPresenterProtocol? { get set }
    func presentModel(model: NewsListModel)
}

struct NewsListModel {

}

final class NewsListView: UIView {
    weak var presenter: NewsListPresenterProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)

        adjustSubviews()
    }

    private func adjustSubviews() {
        setUpConstraints()
    }

    private func setUpConstraints() {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsListView: NewsListViewProtocol {
    func presentModel(model: NewsListModel) {

    }
}
