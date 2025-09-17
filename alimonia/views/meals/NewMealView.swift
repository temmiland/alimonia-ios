import SwiftUI
import CoreData


struct NewMealView: View {
    
    @Environment(\.managedObjectContext) var context
    @Binding var showingDetail: Bool
    @State private var meal: CMeal = CMeal(name: "", category: "", notes: nil, ingredients: [])
    @State private var showImagePicker = false
    @State private var image: UIImage?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.systemGroupedBackground)
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: true) {
                    VStack (alignment: .leading, spacing: 20) {
                        VStack {
                            TextField(
                                "Name",
                                text: $meal.name
                            )
                            .font(.body)
                            .padding(.all, 5)
                            .padding(.top, 0)
                            .autocapitalization(.sentences)
                            Divider()
                            CustomTextEditor("Beschreibung", $meal.notes)
                        }
                        .padding()
                        .frame(maxHeight: 220, alignment: .top)
                        .background(Color(UIColor.secondarySystemGroupedBackground))
                        .cornerRadius(12)
                        
                        HStack {
                            VStack {
                                Text("Bild hinzufügen")
                                    .font(.headline)
                                    .padding([.top, .bottom], 5.0)
                                    .padding(.leading, 10.0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Divider()
                                Text("Füge deiner Mahlzeit ein Bild hinzu, um von Vorschaubildern zu profitieren.")
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding([.top, .bottom], 5.0)
                                    .padding(.leading, 10.0)
                                
                                
                                if(self.image != nil) {
                                    Button(action: {
                                        self.showImagePicker = true
                                    }) {
                                        Image(uiImage: self.image!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 250, height: 250)
                                            .opacity(0.6)
                                            .edgesIgnoringSafeArea(.all)
                                            .cornerRadius(16)
                                            .overlay(
                                                Image(systemName: "photo.fill")
                                                    .font(.largeTitle)
                                                    .foregroundColor(.white)
                                            )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .cornerRadius(16)
                                    .sheet(isPresented: $showImagePicker) {
                                        ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
                                    }
                                } else {
                                    Button(action: {
                                        self.showImagePicker = true
                                    }) {
                                        Image("Placeholder")
                                            .resizable()
                                            .frame(width: 250, height: 250)
                                            .opacity(0.6)
                                            .overlay(
                                                Image(systemName: "photo.fill")
                                                    .font(.largeTitle)
                                                    .foregroundColor(.white)
                                            )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .cornerRadius(16)
                                    .sheet(isPresented: $showImagePicker) {
                                        ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
                                    }
                                }
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemGroupedBackground))
                            .cornerRadius(16)
                            
                        }
                        
                        VStack {
                            if meal.ingredients.count > 0 {
                                /*ForEach(meal.ingredients) { ingredient in
                                 HStack(alignment: .top, spacing: 15) {
                                 GeometryReader { geometry in
                                 HStack(spacing: 0) {
                                 }
                                 }
                                 .frame(height: 50)
                                 .background(Color(UIColor.secondarySystemGroupedBackground))
                                 .cornerRadius(12)
                                 
                                 TextField("Zutat", text: self.$ingredients[index].name).padding()
                                 .frame(maxWidth: .infinity)
                                 .background(Color (UIColor.secondarySystemGroupedBackground))
                                 .cornerRadius(16)
                                 
                                 }
                                 }*/
                            }
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGroupedBackground))
                }
                .fixFlickering()
            }
            .navigationBarTitle(Text("Neue Mahlzeit"), displayMode: .large)
            .navigationBarItems(
                leading: Button("Abbrechen"){
                    self.showingDetail = false
                },
                trailing: Button("Hinzufügen") {
                    self.showingDetail = false
                    self.addMeal()
                }
                .disabled(self.meal.name.isEmpty)
            )
        }
    }
    
    func addMeal() {
        let meal = Meal(context: context)
        meal.id = UUID()
        meal.name = self.meal.name
        meal.notes = self.meal.notes
        meal.category = Bool.random() ? "breakfast" : "lunch"
        meal.img = image?.jpegData(compressionQuality: 0.8) ?? UIImage().jpegData(compressionQuality: 0.8)
        do {
            try context.save()
            DispatchQueue.main.async {
                self.meal = CMeal(name: "", category: "", notes: "", ingredients: [])
            }
        }catch {
            print(error)
        }
    }
}

struct NewMealView_Previews: PreviewProvider {
    static var previews: some View {
        NewMealView(
            showingDetail: .constant(false)
        )
    }
}
