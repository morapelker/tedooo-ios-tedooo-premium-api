import Combine

public enum PremiumPlan {
    case monthly
    case yearly
}

public struct PremiumPerson {
    public init(name: String, avatar: String?) {
        self.name = name
        self.avatar = avatar
    }
    
    public let name: String
    public let avatar: String?
}

public enum BillingProcessResult {
    case success(_ newSubUntil: Int64)
    case cancelled
}

public protocol TedoooPremiumApi {
    
    func startBillingProcess(presentor: UIViewController, plan: PremiumPlan) -> AnyPublisher<BillingProcessResult, Never>
        
    func getPremiumPeople() -> AnyPublisher<[PremiumPerson], Never>
}
