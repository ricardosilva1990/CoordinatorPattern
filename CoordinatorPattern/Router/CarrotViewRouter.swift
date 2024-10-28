import SwiftUI

class CarrotViewRouter {
    enum PopLevel {
        case previous
        case root
    }

    private let rootCoordinator: PushNavigatorCoordinator

    init(rootCoordinator: PushNavigatorCoordinator) {
        self.rootCoordinator = rootCoordinator
    }

    func pop(to popLevel: PopLevel) {
        switch popLevel {
        case .previous:
            self.rootCoordinator.pop()
        case .root:
            self.rootCoordinator.popToRoot()
        }
    }
}

// MARK: - ViewFactory implementation
extension CarrotViewRouter: ViewFactory {
    @ViewBuilder
    func makeView() -> some View {
        let viewModel = CarrotViewModel(router: self)
        
        ContentNavigationView(content: FreshProductView(viewModel: viewModel), title: "🥕")
    }
}

// MARK: - Hashable implementation
extension CarrotViewRouter: Identifiable, Hashable {
    static func == (lhs: CarrotViewRouter, rhs: CarrotViewRouter) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        self.id.hash(into: &hasher)
    }
}

// MARK: - Router mock for preview
extension CarrotViewRouter {
    static let mock: CarrotViewRouter = .init(rootCoordinator: AppRouter())
}
