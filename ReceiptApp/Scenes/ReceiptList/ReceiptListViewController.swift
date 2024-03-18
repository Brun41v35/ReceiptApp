import UIKit

final class ReceiptListViewController: UIViewController, ReceiptListViewControllerType {

    // MARK: - Internal

    var delegate: ReceiptListViewControllerDelegate?
    var receiptCell: [ReceiptListViewModelCell]?
    var informations: [Informations]?

    // MARK: - Private Properties

    private let contentView: ReceiptListViewType
    private let presenter: ReceiptListPresenterType

    // MARK: - Init

    init(contentView: ReceiptListViewType = ReceiptListView(),
         presenter: ReceiptListPresenterType) {
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
        setup()
    }

    // MARK: - Setup

    private func setup() {
        setupNavigationTitle()
        setupTableViewDataSource()
        presenter.loadData()
    }

    private func setupNavigationTitle() {
        title = "Receipt 🧾"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupTableViewDataSource() {
        contentView.show(dataSource: self, delegate: self)
    }
}

// MARK: - UITableViewDataSource

extension ReceiptListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiptCell?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptListViewCell",
                                                       for: indexPath) as? ReceiptListViewCell else {
            return UITableViewCell()
        }
        guard let viewModel = receiptCell?[indexPath.row] else { return UITableViewCell() }
    
        cell.show(viewModel: viewModel)
        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ReceiptListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let informations = informations?[indexPath.row] else { return }
        delegate?.showReceipt(with: informations)
    }
}
