import Foundation

struct ReceiptData: Decodable, Equatable {
    let data: [Receipts]
}

// MARK: - Receipts

struct Receipts: Decodable, Equatable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
}
