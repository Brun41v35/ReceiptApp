import UIKit
@testable import ReceiptApp

final class ReceiptViewSpy: UIView, ReceiptViewType {

    // MARK: - Private

    private(set) var showViewModelArgs = [Informations]()

    // MARK: Methods

    func show(viewModel: Informations) {
        showViewModelArgs.append(viewModel)
    }
}
