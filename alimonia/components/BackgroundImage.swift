import SwiftUI

struct BackgroundImage: ViewModifier {
    let uiImage: UIImage
    let blurRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .mask(
                        LinearGradient(
                            gradient: Gradient(colors: [.black, .clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(maxHeight: .infinity)
                    )
                    .blur(radius: max(0, blurRadius))
            )
    }
}

extension View {
    func backgroundImage(_ uiImage: UIImage, blurRadius: CGFloat) -> some View {
        self.modifier(BackgroundImage(uiImage: uiImage, blurRadius: blurRadius))
    }
}
