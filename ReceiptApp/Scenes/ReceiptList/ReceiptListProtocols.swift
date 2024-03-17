import UIKit

protocol ReceiptListViewType where Self: UIView {
    func show(dataSource: UITableViewDataSource,
              delegate: UITableViewDelegate)
}

protocol ReceiptListPresenterType {
    var viewController: ReceiptListViewControllerType? { get set }
    func loadData()
}

protocol ReceiptListViewControllerType: AnyObject {
    var delegate: ReceiptListViewControllerDelegate? { get set }
    var receiptCell: [ReceiptListViewModelCell]? { get set }
    var informations: [Informations]? { get set }
}

protocol ReceiptListAdapterType {
    func adapt(with receiptData: ReceiptData) -> [ReceiptListViewModelCell]
}

protocol ReceiptListViewControllerDelegate: AnyObject {
    func showReceipt(with informations: Informations)
}
