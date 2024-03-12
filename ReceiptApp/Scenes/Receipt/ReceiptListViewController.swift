import UIKit

final class ReceiptListViewController: UIViewController {

    // MARK: - Private Properties

    private let contentView: ReceiptView

    // MARK: - Init

    init(contentView: ReceiptView = ReceiptView()) {
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
