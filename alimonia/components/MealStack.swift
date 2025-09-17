import SwiftUI

struct MealStack: View {
    var meal: Meal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            mealImage
                .resizable()
                .scaledToFill()
                .frame(width: 165, height: 165)
                .clipped()
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(meal.name ?? "Unknown Meal")
                    .font(.system(size: 14, weight: .semibold))
                    .lineLimit(1)
                
                Text(meal.notes ?? "")
                    .font(.system(size: 12))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .frame(width: 165, height: 220)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
        .shadow(radius: 1)
    }
    
    private var mealImage: Image {
        if let data = meal.img, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        } else {
            return Image("Placeholder")
        }
    }
}

struct MealStack_Previews: PreviewProvider {
    static var previews: some View {
        MealStack(meal: Meal())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
