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

public protocol TedoooPremiumApi {
    
    func startBillingProcess(presentor: UIViewController, plan: PremiumPlan) -> AnyPublisher<Int64, Never>
        
    func getPremiumPeople() -> AnyPublisher<[PremiumPerson], Never>
}
