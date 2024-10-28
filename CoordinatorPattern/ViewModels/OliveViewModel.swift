import Foundation

class OliveViewModel: ObservableObject {
    private let router: OliveViewRouter

    init(router: OliveViewRouter) {
        self.router = router
    }

    func moveToAppleView() {
        self.router.dismiss()
    }
}

// MARK: - FreshProductViewModel implementation
extension OliveViewModel: FreshProductViewModel {
    var options: [MenuOption] {
        [
            .init(text: "Dismiss", action: moveToAppleView)
        ]
    }
}

// MARK: - Mock for Preview
extension OliveViewModel {
    static let mock: OliveViewModel = .init(router: .mock)
}
