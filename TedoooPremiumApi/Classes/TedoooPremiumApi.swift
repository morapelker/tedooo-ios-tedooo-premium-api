import Combine

public enum PremiumPlan {
    case monthly
    case yearly
}

public protocol TedoooPremiumApi {
    
    func startBillingProcess(presentor: UIViewController, plan: PremiumPlan) -> AnyPublisher<Int64, Never>
        
}
