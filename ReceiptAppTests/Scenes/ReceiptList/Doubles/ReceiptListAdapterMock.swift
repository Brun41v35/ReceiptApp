@testable import ReceiptApp

final class ReceiptListAdapterMock: ReceiptListAdapterType {

    // MARK: - Internal

    var adaptReturn: [ReceiptListViewModelCell] = [.stub()]

    // MARK: - Private

    private(set) var receiptDataArgs = [ReceiptData]()

    // MARK: - Internal Methods

    func adapt(with receiptData: ReceiptData) -> [ReceiptListViewModelCell] {
        receiptDataArgs.append(receiptData)
        return adaptReturn
    }
}
