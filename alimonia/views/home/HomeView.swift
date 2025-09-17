import SwiftUI

struct HomeView: View {
    @Binding var selectedTab: Int // bind this to MainView's selection
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome 🥦")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 60)
            
            Text("Track your meals, create weekly nutrition plans, and organize your groceries.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            Button("Create Meal Plan") {
                selectedTab = 3
            }
            .buttonStyle(.borderedProminent)
            
            Button("My Recipes") {
                selectedTab = 2
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var selectedTab = 1
    static var previews: some View {
        HomeView(selectedTab: $selectedTab)
    }
}
