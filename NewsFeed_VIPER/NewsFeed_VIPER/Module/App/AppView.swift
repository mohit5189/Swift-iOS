import UIKit

protocol AppViewProtocol: AnyView {
    var presenter: AppPresenterProtocol? { get set }
    func presentModel(model: AppModel)
}

struct AppModel {

}

final class AppView: UIView {
    weak var presenter: AppPresenterProtocol?

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

extension AppView: AppViewProtocol {
    func presentModel(model: AppModel) {

    }
}
