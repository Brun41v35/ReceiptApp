protocol FactoryNetworkingType {
    func build(with environment: Environment) -> NetworkManagerType
}
