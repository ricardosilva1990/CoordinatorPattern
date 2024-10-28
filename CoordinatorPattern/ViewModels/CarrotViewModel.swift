import Foundation

class CarrotViewModel: ObservableObject {
    private let router: CarrotViewRouter

    init(router: CarrotViewRouter) {
        self.router = router
    }

    func moveToBananaView() {
        self.router.pop(to: .previous)
    }

    func moveToAppleView() {
        self.router.pop(to: .root)
    }
}

// MARK: - FreshProductViewModel implementation
extension CarrotViewModel: FreshProductViewModel {
    var options: [MenuOption] {
        [
            .init(text: "Pop", action: moveToBananaView),
            .init(text: "Pop to Root", action: moveToAppleView)
        ]
    }
}

// MARK: - Mock for Preview
extension CarrotViewModel {
    static let mock: CarrotViewModel = .init(router: .mock)
}
