import UIKit

final class ReceiptView: UIView {

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
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }
}
