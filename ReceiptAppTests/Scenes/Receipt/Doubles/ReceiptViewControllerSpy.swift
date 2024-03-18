@testable import ReceiptApp

final class ReceiptViewControllerSpy: ReceiptViewControllerType {

    private(set) var showViewModelArgs = [Informations]()
    func show(viewModel: Informations) {
        showViewModelArgs.append(viewModel)
    }
}
