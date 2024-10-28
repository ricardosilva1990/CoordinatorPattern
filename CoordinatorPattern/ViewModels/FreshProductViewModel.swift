import Foundation

struct MenuOption: Identifiable {
    let id: UUID = .init()

    let text: String
    let action: () -> Void
}

protocol FreshProductViewModel {
    var options: [MenuOption] { get }
}
