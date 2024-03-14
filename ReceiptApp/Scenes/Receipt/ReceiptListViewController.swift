import UIKit

final class ReceiptListViewController: UIViewController {

    // MARK: - Private Properties

    private let contentView: ReceiptListView

    // MARK: - Init

    init(contentView: ReceiptListView = ReceiptListView()) {
        self.contentView = contentView
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
        setupTableViewDataSource()
    }

    // MARK: - Setup

    private func setupTableViewDataSource() {
        contentView.show(dataSource: self, delegate: self)
    }
}

// MARK: - UITableViewDataSource

extension ReceiptListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptListViewCell", for: indexPath) as? ReceiptListViewCell else {
            return UITableViewCell()
        }
        cell.show(viewModel: ReceiptListViewModelCell(title: "title", name: "name", date: "date", amount: "amount"))

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ReceiptListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
