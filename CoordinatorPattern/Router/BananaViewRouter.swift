import SwiftUI

class BananaViewRouter {
    enum Destination {
        case carrot
    }

    private let rootCoordinator: PushNavigatorCoordinator

    init(rootCoordinator: PushNavigatorCoordinator) {
        self.rootCoordinator = rootCoordinator
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .carrot:
            let router = CarrotViewRouter(rootCoordinator: self.rootCoordinator)
            self.rootCoordinator.push(router)
        }
    }

    func popToPrevious() {
        self.rootCoordinator.pop()
    }
}

// MARK: - ViewFactory implementation
extension BananaViewRouter: ViewFactory {
    @ViewBuilder
    func makeView() -> some View {
        let viewModel = BananaViewModel(router: self)
        
        ContentNavigationView(content: FreshProductView(viewModel: viewModel), title: "🍌")
    }
}

// MARK: - Hashable implementation
extension BananaViewRouter: Identifiable, Hashable {
    static func == (lhs: BananaViewRouter, rhs: BananaViewRouter) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        self.id.hash(into: &hasher)
    }
}

// MARK: - Router mock for preview
extension BananaViewRouter {
    static let mock: BananaViewRouter = .init(rootCoordinator: AppRouter())
}
