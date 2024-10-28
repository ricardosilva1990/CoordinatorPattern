import SwiftUI

protocol ViewFactory {
    associatedtype Content: View

    func makeView() -> Content
}
