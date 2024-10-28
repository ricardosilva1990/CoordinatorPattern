import SwiftUI

struct ContentNavigationView<Content: View>: View {
    private let content: Content
    private let title: String
    private let embedInNavigationStack: Bool

    init(content: Content, title: String, embedInNavigationStack: Bool = false) {
        self.content = content
        self.title = title
        self.embedInNavigationStack = embedInNavigationStack
    }

    @ViewBuilder
    func addTitleToContent() -> some View {
        content
            .navigationTitle(title)
    }

    var body: some View {
        if embedInNavigationStack {
            NavigationStack(root: addTitleToContent)
        } else {
            addTitleToContent()
        }
    }
}

#Preview("Navigation View not embedded") {
    ContentNavigationView(
        content: FreshProductView.init(viewModel: AppleViewModel.mock), 
        title: "🍎"
    )
}

#Preview("Navigation View embedded") {
    ContentNavigationView(
        content: FreshProductView.init(viewModel: AppleViewModel.mock), 
        title: "🍎",
        embedInNavigationStack: true
    )
}
