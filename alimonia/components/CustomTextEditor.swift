import SwiftUI

struct CustomTextEditor: View {
    let placeholder: String
    @Binding var text: String?
    
    init(_ placeholder: String, _ text: Binding<String?>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if (text?.isEmpty ?? true) {
                Text(placeholder)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.gray.opacity(0.6))
                    .padding(.top, 8)
                    .padding(.leading, 5)
            }
            
            TextEditor(text: Binding($text, replacingNilWith: ""))
                .font(.system(.body, design: .rounded))
                .background(Color.clear)
        }
        .frame(height: 80, alignment: .center)
    }
}

// MARK: - Binding Nil Helper
extension Binding where Value: Equatable {
    init(_ source: Binding<Value?>, replacingNilWith defaultValue: Value) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { newValue in
                source.wrappedValue = (newValue == defaultValue) ? nil : newValue
            }
        )
    }
}
