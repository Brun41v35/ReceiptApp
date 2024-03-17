import UIKit

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

final class ReceiptViewController: UIViewController {

    // MARK: - Private Properties

    private let contentView: ReceiptViewType
    private let presenter: ReceiptPresenterType

    // MARK: - Init

    init(contentView: ReceiptViewType = ReceiptView(),
         presenter: ReceiptPresenterType) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
    }
}

// MARK: - ReceiptViewType

extension ReceiptViewController: ReceiptViewControllerType {

    func show(viewModel: Informations) {
        contentView.show(viewModel: viewModel)
    }
}
