import Foundation

class AppleViewModel {
    private let router: AppleViewRouter

    init(router: AppleViewRouter) {
        self.router = router
    }

    func moveToBananaView() {
        self.router.navigate(to: .banana)
    }

    func moveToLemonView() {
        self.router.navigate(to: .lemon)
    }

    func moveToOliveView() {
        self.router.navigate(to: .olive)
    }
}

// MARK: - FreshProductViewModel implementation
extension AppleViewModel: FreshProductViewModel {
    var options: [MenuOption] {
        [
            .init(text: "Push 🍌", action: moveToBananaView),
            .init(text: "Present 🍋", action: moveToLemonView),
            .init(text: "Present 🫒", action: moveToOliveView)
        ]
    }
}

// MARK: - Mock for Preview
extension AppleViewModel {
    static let mock: AppleViewModel = .init(router: .mock)
}
