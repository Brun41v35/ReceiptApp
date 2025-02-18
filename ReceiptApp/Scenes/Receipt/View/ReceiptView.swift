import UIKit

final class ReceiptView: UIView {

    // MARK: - Private Properties

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.text = "Titulo"
        return label
    }()

    private let titleValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let nameStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()

    private let nameValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let receiverNameStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let receiverNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do favorecido"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()

    private let receiverNameValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let amountStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "Valor"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()

    private let amountValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let dateStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Data"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()

    private let dateValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let controlStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let controlLabel: UILabel = {
        let label = UILabel()
        label.text = "Controle"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()

    private let controlValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    private let receiptIdStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let receiptIdLabel: UILabel = {
        let label = UILabel()
        label.text = "ID da transação"
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()

    private let receiptIdValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
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
        addSubview(containerView)
        containerView.addSubview(containerStackView)

        containerStackView.addArrangedSubview(titleStackView)
        containerStackView.addArrangedSubview(nameStackView)
        containerStackView.addArrangedSubview(receiverNameStackView)
        containerStackView.addArrangedSubview(amountStackView)
        containerStackView.addArrangedSubview(dateStackView)
        containerStackView.addArrangedSubview(controlStackView)
        containerStackView.addArrangedSubview(receiptIdStackView)
    
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(titleValueLabel)

        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameValueLabel)

        receiverNameStackView.addArrangedSubview(receiverNameLabel)
        receiverNameStackView.addArrangedSubview(receiverNameValueLabel)

        amountStackView.addArrangedSubview(amountLabel)
        amountStackView.addArrangedSubview(amountValueLabel)

        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(dateValueLabel)

        controlStackView.addArrangedSubview(controlLabel)
        controlStackView.addArrangedSubview(controlValueLabel)

        receiptIdStackView.addArrangedSubview(receiptIdLabel)
        receiptIdStackView.addArrangedSubview(receiptIdValueLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }

    private func setupBackgroundColor() {
        backgroundColor = .defaultBackground
    }
}

// MARK: - ReceiptListViewType

extension ReceiptView: ReceiptViewType {

    func show(viewModel: Informations) {
        titleValueLabel.text = viewModel.title
        nameValueLabel.text = viewModel.name
        receiverNameValueLabel.text = viewModel.receiverName
        amountValueLabel.text = viewModel.amount
        dateValueLabel.text = viewModel.date
        controlValueLabel.text = viewModel.control
        receiptIdValueLabel.text = viewModel.receiptId
    }
}
