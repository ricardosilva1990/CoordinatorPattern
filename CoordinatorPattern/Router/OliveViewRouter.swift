import SwiftUI

class OliveViewRouter {
    private let rootCoordinator: FullScreenCoverNavigatorCoordinator

    init(rootCoordinator: FullScreenCoverNavigatorCoordinator) {
        self.rootCoordinator = rootCoordinator
    }

    func dismiss() {
        self.rootCoordinator.dismissFullScreenCover()
    }
}

// MARK: - ViewFactory implementation
extension OliveViewRouter: ViewFactory {
    @ViewBuilder
    func makeView() -> some View {
        let viewModel = OliveViewModel(router: self)
        ContentNavigationView(content: FreshProductView(viewModel: viewModel), title: "🫒", embedInNavigationStack: true)
    }
}

// MARK: - Hashable implementation
extension OliveViewRouter: Identifiable, Hashable {
    static func == (lhs: OliveViewRouter, rhs: OliveViewRouter) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        self.id.hash(into: &hasher)
    }
}

// MARK: - Router mock for preview
extension OliveViewRouter {
    static let mock: OliveViewRouter = .init(rootCoordinator: AppRouter())
}
