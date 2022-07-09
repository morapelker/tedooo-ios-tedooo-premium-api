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

public struct SubInformation {
    
    public let hasTrial: Bool
    public let monthId: String
    public let yearId: String
    
    public init(monthId: String, yearId: String, hasTrial: Bool) {
        self.monthId = monthId
        self.yearId = yearId
        self.hasTrial = hasTrial
    }
    
}

public enum SubError: Error {
    case alreadySubbed
}

public protocol TedoooPremiumApi {
    
    func validateSubPermissions() -> AnyPublisher<SubInformation, SubError>
    
    func registerSubInformation(_ information: SubInformation)
    
    func startBillingProcess(presentor: UIViewController, plan: PremiumPlan) -> AnyPublisher<BillingProcessResult, Never>
        
    func getPremiumPeople() -> AnyPublisher<[PremiumPerson], Never>
}
