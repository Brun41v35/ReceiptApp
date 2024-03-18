import Foundation

final class ReceiptListPresenter {

    // MARK: - Internal Properties

    weak var viewController: ReceiptListViewControllerType?

    // MARK: - Private Properties

    private let networkManager: NetworkingType
    private let adapter: ReceiptListAdapterType

    // MARK: - Init

    init(networkManager: NetworkingType,
         adapter: ReceiptListAdapterType = ReceiptListAdapter()) {
        self.networkManager = networkManager
        self.adapter = adapter
    }

    // MARK: - Private Methods

    private func fetchData() {
        networkManager.environment().fetchData { [weak self] result in
            self?.handleResponse(with: result)
        }
    }

    private func handleResponse(with result: Result<ReceiptData, APIError>) {
        if case .success(let response) = result {
            let valueAdapted = adapter.adapt(with: response)
            let informations = response.data.receipts

            viewController?.receiptCell = valueAdapted
            viewController?.informations = informations
        }
    }
}

// MARK: - ReceiptListPresenter

extension ReceiptListPresenter: ReceiptListPresenterType {

    func loadData() {
        fetchData()
    }
}
