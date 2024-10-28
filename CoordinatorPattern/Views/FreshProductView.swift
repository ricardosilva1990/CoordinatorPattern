import SwiftUI

struct FreshProductView<ViewModel: FreshProductViewModel>: View {
    var viewModel: ViewModel

    var body: some View {
        List(viewModel.options) {
            Button($0.text, action: $0.action)
        }
    }
}

#Preview("AppleView") {
    FreshProductView(viewModel: AppleViewModel.mock)
}

#Preview("BananaView") {
    FreshProductView(viewModel: BananaViewModel.mock)
}

#Preview("CarrotView") {
    FreshProductView(viewModel: CarrotViewModel.mock)
}

#Preview("LemonView") {
    FreshProductView(viewModel: LemonViewModel.mock)
}

#Preview("OliveView") {
    FreshProductView(viewModel: OliveViewModel.mock)
}
