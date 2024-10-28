import SwiftUI

class LemonViewRouter {
    private let rootCoordinator: SheetNavigatorCoordinator

    init(rootCoordinator: SheetNavigatorCoordinator) {
        self.rootCoordinator = rootCoordinator
    }

    func dismiss() {
        self.rootCoordinator.dismissSheet()
    }
}

// MARK: - ViewFactory implementation
extension LemonViewRouter: ViewFactory {
    @ViewBuilder
    func makeView() -> some View {
        let viewModel = LemonViewModel(router: self)
        
        ContentNavigationView(content: FreshProductView(viewModel: viewModel), title: "🍋", embedInNavigationStack: true)
    }
}

// MARK: - Hashable implementation
extension LemonViewRouter: Identifiable, Hashable {
    static func == (lhs: LemonViewRouter, rhs: LemonViewRouter) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        self.id.hash(into: &hasher)
    }
}

// MARK: - Router mock for preview
extension LemonViewRouter {
    static let mock: LemonViewRouter = .init(rootCoordinator: AppRouter())
}
