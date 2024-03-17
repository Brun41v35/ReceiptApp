@testable import ReceiptApp

extension ReceiptListViewModelCell {

    static func stub(title: String = "Transferência",
                     name: String = "Débora dos Santos",
                     date: String = "qua, 27 de abril de 2022",
                     amount: String = "R$ 5.000,00") -> Self {
        
        return ReceiptListViewModelCell(title: title,
                                        name: name,
                                        date: date,
                                        amount: amount)
    }
}
