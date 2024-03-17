import UIKit

final class ReceiptViewController: UIViewController {

    // MARK: - Private Properties

    private let contentView: ReceiptViewType

    // MARK: - Init

    init(contentView: ReceiptViewType = ReceiptView()) {
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
    }
}
