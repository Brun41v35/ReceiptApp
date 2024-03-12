import UIKit

protocol ReceiptViewCellType where Self: UIView {
    func show(viewModel: ReceiptViewModelCell)
}
