import Foundation

final class ReceiptListPresenter {

    // MARK: - Internal Properties

    weak var viewController: ReceiptListViewControllerType?

    // MARK: - Private Properties

    private let networkManager: NetworkManagerType
    private let adapter: ReceiptListAdapterType

    // MARK: - Init

    init(networkManager: NetworkManagerType,
         adapter: ReceiptListAdapterType = ReceiptListAdapter()) {
        self.networkManager = networkManager
        self.adapter = adapter
    }

    // MARK: - Private Methods

    private func fetchData() {
        networkManager.fetchData { [weak self] result in
            self?.handleResponse(with: result)
        }
    }

    private func handleResponse(with result: Result<ReceiptData, APIError>) {
        switch result {
        case .success(let response):

            let valueAdapted = adapter.adapt(with: response)
            let informations = response.data.receipts

            viewController?.receiptCell = valueAdapted
            viewController?.informations = informations
        case .failure(let failure):
            print("‼️: \(failure)")
        }
    }
}

// MARK: - ReceiptListPresenter

extension ReceiptListPresenter: ReceiptListPresenterType {

    func loadData() {
        fetchData()
    }
}
