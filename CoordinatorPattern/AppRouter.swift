import SwiftUI

class AppRouter: ObservableObject {
    @Published var navigationPath: NavigationPath
    @Published var currentSheet: AnyRoutable?
    @Published var currentFullScreenCover: AnyRoutable?

    init(navigationPath: NavigationPath = .init()) {
        self.navigationPath = navigationPath
    }

    func resolveInitialRouter() -> some Routable {
        AppleViewRouter(rootCoordinator: self)
    }
}

// MARK: - PushNavigationCoordinator implementation

extension AppRouter: PushNavigatorCoordinator {
    func push(_ path: any Routable) {
        let wrappedRouter = AnyRoutable(path)
        self.navigationPath.append(wrappedRouter)
    }

    func pop() {
        self.navigationPath.removeLast()
    }

    func popToRoot() {
        self.navigationPath.removeLast(self.navigationPath.count)
    }
}

extension AppRouter: SheetNavigatorCoordinator {
    func show(sheet path: any Routable) {
        self.currentSheet = AnyRoutable(path)
    }
    
    func dismissSheet() {
        self.currentSheet = nil
    }
}

extension AppRouter: FullScreenCoverNavigatorCoordinator {
    func show(fullScreenCover path: any Routable) {
        self.currentFullScreenCover = AnyRoutable(path)
    }

    func dismissFullScreenCover() {
        self.currentFullScreenCover = nil
    }
}
