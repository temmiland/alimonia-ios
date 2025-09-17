import SwiftUI
import NavigationSearchBar
import CoreData


/// Bundles all meal related views
struct MealView: View {
    
    @State var showingDetail = false
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Meal.entity(), sortDescriptors: [NSSortDescriptor(key:"name", ascending:true)])
    var meals: FetchedResults<Meal>
    let columns = [GridItem(.adaptive(minimum: 165))]
    
    var body: some View {
        NavigationView {
            ZStack {
                // Fixes the background color above the ScrollView
                Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all)
                ScrollView {
                    // VStack needed to increase the space between NavigationTitle and LazyVGrid
                    VStack {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(meals, id: \.self) { meal in
                                NavigationLink(
                                    destination: DetailMealView(meal: meal)
                                ) {
                                    MealStack(meal: meal)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
                .fixFlickering()
                .navigationTitle("Mahlzeiten")
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            showingDetail = true
                        }, label: {
                            Image(systemName: "plus.circle")
                                .imageScale(.large)
                        }))
                .sheet(isPresented: $showingDetail) {
                    NewMealView(showingDetail: $showingDetail)
                }
                .background(Color(UIColor.systemGroupedBackground))
            }
        }
    }
}


struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
