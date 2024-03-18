import Foundation

final class ReceiptPresenter {

    // MARK: - Internal Properties

    weak var viewController: ReceiptViewControllerType?

    // MARK: - Private Properties

    let informations: Informations

    // MARK: - Init

    init(informations: Informations) {
        self.informations = informations
    }
}

extension ReceiptPresenter: ReceiptPresenterType {

    func loadData() {
        viewController?.show(viewModel: informations)
    }
}
