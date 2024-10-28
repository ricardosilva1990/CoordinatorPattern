import SwiftUI

struct CustomNavigationView: View {
    @StateObject var appRouter: AppRouter

    var body: some View {
        NavigationStack(path: $appRouter.navigationPath) {
            appRouter.resolveInitialRouter().makeView()
                .navigationDestination(for: AnyRoutable.self) {
                    $0.makeView()
                }
                .sheet(item: $appRouter.currentSheet) {
                    $0.makeView()
                }
                .fullScreenCover(item: $appRouter.currentFullScreenCover) {
                    $0.makeView()
                }
        }
    }
}

#Preview {
    CustomNavigationView(appRouter: .init())
}
