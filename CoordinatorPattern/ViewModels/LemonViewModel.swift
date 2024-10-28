import Foundation

class LemonViewModel: ObservableObject {
    private let router: LemonViewRouter

    init(router: LemonViewRouter) {
        self.router = router
    }

    func moveToAppleView() {
        self.router.dismiss()
    }
}

// MARK: - FreshProductViewModel implementation
extension LemonViewModel: FreshProductViewModel {
    var options: [MenuOption] {
        [
            .init(text: "Dismiss", action: moveToAppleView)
        ]
    }
}

// MARK: - Mock for Preview
extension LemonViewModel {
    static let mock: LemonViewModel = .init(router: .mock)
}
