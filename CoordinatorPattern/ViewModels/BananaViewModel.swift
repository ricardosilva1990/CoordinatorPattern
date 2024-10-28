import Foundation

class BananaViewModel: ObservableObject {
    private let router: BananaViewRouter

    init(router: BananaViewRouter) {
        self.router = router
    }

    func moveToCarrotView() {
        self.router.navigate(to: .carrot)
    }

    func moveToAppleView() {
        self.router.popToPrevious()
    }
}

// MARK: - FreshProductViewModel implementation
extension BananaViewModel: FreshProductViewModel {
    var options: [MenuOption] {
        [
            .init(text: "Push 🥕", action: moveToCarrotView),
            .init(text: "Pop", action: moveToAppleView)
        ]
    }
}

// MARK: - Mock for Preview
extension BananaViewModel {
    static let mock: BananaViewModel = .init(router: .mock)
}
