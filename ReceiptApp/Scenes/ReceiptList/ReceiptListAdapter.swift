import Foundation

final class ReceiptListAdapter: ReceiptListAdapterType {

    func adapt(with receiptData: ReceiptData) -> [ReceiptListViewModelCell] {

        let viewModel = receiptData.data.receipts.map {
            let cell = ReceiptListViewModelCell(title: $0.title,
                                                name: $0.name,
                                                date: $0.date,
                                                amount: $0.amount)
            return cell
        }

        return viewModel
    }
}
