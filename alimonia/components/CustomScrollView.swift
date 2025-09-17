import SwiftUI

struct CustomScrollView<Content: View>: View {
    let content: Content
    let bgImage: UIImage
    @State private var offset: CGFloat = 0
    
    init(bgImage: UIImage, @ViewBuilder contentBuilder: () -> Content) {
        self.bgImage = bgImage
        self.content = contentBuilder()
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                content
            }
            .padding(.top, 16)
            .padding(.bottom, 100)
            .background(
                GeometryReader { geo in
                    Color.clear.preference(
                        key: ViewOffsetKey.self,
                        value: geo.frame(in: .named("scroll")).minY
                    )
                }
            )
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ViewOffsetKey.self) { value in
            self.offset = -value
        }
        .background(
            Color(UIColor.systemGroupedBackground)
                .opacity(Double(
                    self.offset >= 600
                        ? 600.0 / 300.0
                        : self.offset / 300.0
                ))
        )
        .modifier(
            BackgroundImage(
                uiImage: bgImage,
                blurRadius: min(max(offset / 100, 0), 6) // Clamp blur radius
            )
        )
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
