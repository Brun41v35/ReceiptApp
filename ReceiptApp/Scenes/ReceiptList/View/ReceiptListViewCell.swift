import UIKit

final class ReceiptListViewCell: UITableViewCell {

    // MARK: - Private Properties

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .primaryGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let lendingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let trailingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        setupAccessibility()
    }

    private func addHierarchyView() {
        addSubview(containerView)
        containerView.addSubview(horizontalStackView)

        horizontalStackView.addArrangedSubview(lendingStackView)
        horizontalStackView.addArrangedSubview(trailingStackView)

        lendingStackView.addArrangedSubview(titleLabel)
        lendingStackView.addArrangedSubview(nameLabel)

        trailingStackView.addArrangedSubview(dateLabel)
        trailingStackView.addArrangedSubview(amountLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            horizontalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            horizontalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            horizontalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }

    private func setupAccessibility() {
        accessibilityTraits = .button
    }

    // MARK: - Internal Methods

    func show(viewModel: ReceiptListViewModelCell) {
        titleLabel.text = viewModel.title
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        amountLabel.text = viewModel.amount

        accessibilityLabel = viewModel.title
        accessibilityValue = "\(viewModel.name), \(viewModel.date), \(viewModel.amount)"
    }
}
