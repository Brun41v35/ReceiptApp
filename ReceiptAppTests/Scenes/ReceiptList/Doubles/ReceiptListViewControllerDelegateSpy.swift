@testable import ReceiptApp

final class ReceiptListViewControllerDelegateSpy: ReceiptListViewControllerDelegate {

    // MARK: - Private

    private(set) var showReceiptInformationsArgs = [Informations]()

    // MARK: - Internal Methods

    func showReceipt(with informations: Informations) {
        showReceiptInformationsArgs.append(informations)
    }
}
