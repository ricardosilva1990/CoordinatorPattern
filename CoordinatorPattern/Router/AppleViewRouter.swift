import SwiftUI

typealias RootViewCoordinator = PushNavigatorCoordinator & SheetNavigatorCoordinator & FullScreenCoverNavigatorCoordinator

class AppleViewRouter {
    enum Destination {
        case banana
        case lemon
        case olive
    }
    
    private let rootCoordinator: RootViewCoordinator

    init(rootCoordinator: RootViewCoordinator) {
        self.rootCoordinator = rootCoordinator
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .banana:
            let router = BananaViewRouter(rootCoordinator: self.rootCoordinator)
            rootCoordinator.push(router)
        case .lemon:
            let router = LemonViewRouter(rootCoordinator: self.rootCoordinator)
            rootCoordinator.show(sheet: router)
        case .olive:
            let router = OliveViewRouter(rootCoordinator: self.rootCoordinator)
            rootCoordinator.show(fullScreenCover: router)
        }
    }
}

// MARK: - ViewFactory implementation
extension AppleViewRouter: ViewFactory {
    @ViewBuilder
    func makeView() -> some View {
        let viewModel = AppleViewModel(router: self)
        
        ContentNavigationView(content: FreshProductView(viewModel: viewModel), title: "🍎")
    }
}

// MARK: - Hashable implementation
extension AppleViewRouter: Identifiable, Hashable {
    static func == (lhs: AppleViewRouter, rhs: AppleViewRouter) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        self.id.hash(into: &hasher)
    }
}

// MARK: - Router mock for preview
extension AppleViewRouter {
    static let mock: AppleViewRouter = .init(rootCoordinator: AppRouter())
}
