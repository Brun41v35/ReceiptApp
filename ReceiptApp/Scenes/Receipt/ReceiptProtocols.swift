import UIKit

protocol ReceiptViewType where Self: UIView {
    func show(viewModel: Informations)
}

protocol ReceiptViewControllerType: AnyObject {
    func show(viewModel: Informations)
}

protocol ReceiptPresenterType {
    var viewController: ReceiptViewControllerType? { get set }
    func loadData()
}
