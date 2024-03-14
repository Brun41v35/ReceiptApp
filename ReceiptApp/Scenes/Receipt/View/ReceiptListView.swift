import UIKit

final class ReceiptListView: UIView {

    // MARK: - Private Properties

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setup() {
        addHierarchyView()
        setupConstraints()
        setupBackgroundColor()
    }

    private func addHierarchyView() {
        addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }

    private func setupTableView(with dataSource: UITableViewDataSource,
                                and delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(ReceiptListViewCell.self, forCellReuseIdentifier: "ReceiptListViewCell")
    }
}

// MARK: - ReceiptListViewType

extension ReceiptListView: ReceiptListViewType {

    func show(dataSource: UITableViewDataSource,
              delegate: UITableViewDelegate) {
        setupTableView(with: dataSource, and: delegate)
    }
}
