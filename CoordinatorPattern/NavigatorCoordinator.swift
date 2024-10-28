protocol PushNavigatorCoordinator {
    func push(_ path: any Routable)
    func pop()
    func popToRoot()
}

protocol SheetNavigatorCoordinator {
    func show(sheet path: any Routable)
    func dismissSheet()
}

protocol FullScreenCoverNavigatorCoordinator {
    func show(fullScreenCover path: any Routable)
    func dismissFullScreenCover()
}
