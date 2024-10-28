import SwiftUI

struct AnyRoutable {
    private let base: any Routable
    private let equals: (any Routable) -> Bool

    let id = UUID()

    init<T: Routable>(_ routable: T) {
        base = routable
        equals = { other in
            guard let otherBase = other as? T else { return false }
            return routable == otherBase
        }
    }
}

extension AnyRoutable: Routable {
    func makeView() -> some View {
        AnyView(self.base.makeView())
    }

    func hash(into hasher: inout Hasher) {
        self.base.hash(into: &hasher)
    }

    static func == (lhs: AnyRoutable, rhs: AnyRoutable) -> Bool {
        lhs.equals(rhs.base)
    }
}
