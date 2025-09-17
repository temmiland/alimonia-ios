import SwiftUI
import CoreData

extension Font {
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    
    static func avenirNextRegular(size: Int) -> Font {
        return Font.custom("AvenirNext-Regular", size: CGFloat(size))
    }
}

let loremIpsum = """
Lorem ipsum dolor sit amet consectetur adipiscing elit donec, gravida commodo hac non mattis augue duis vitae inceptos, laoreet taciti at vehicula cum arcu dictum. Cras netus vivamus sociis pulvinar est erat, quisque imperdiet velit a justo maecenas, pretium gravida ut himenaeos nam. Tellus quis libero sociis class nec hendrerit, id proin facilisis praesent bibendum vehicula tristique, fringilla augue vitae primis turpis.
Sagittis vivamus sem morbi nam mattis phasellus vehicula facilisis suscipit posuere metus, iaculis vestibulum viverra nisl ullamcorper lectus curabitur himenaeos dictumst malesuada tempor, cras maecenas enim est eu turpis hac sociosqu tellus magnis. Sociosqu varius feugiat volutpat justo fames magna malesuada, viverra neque nibh parturient eu nascetur, cursus sollicitudin placerat lobortis nunc imperdiet. Leo lectus euismod morbi placerat pretium aliquet ultricies metus, augue turpis vulputa
te dictumst mattis egestas laoreet, cubilia habitant magnis lacinia vivamus etiam aenean.
Sagittis vivamus sem morbi nam mattis phasellus vehicula facilisis suscipit posuere metus, iaculis vestibulum viverra nisl ullamcorper lectus curabitur himenaeos dictumst malesuada tempor, cras maecenas enim est eu turpis hac sociosqu tellus magnis. Sociosqu varius feugiat volutpat justo fames magna malesuada, viverra neque nibh parturient eu nascetur, cursus sollicitudin placerat lobortis nunc imperdiet. Leo lectus euismod morbi placerat pretium aliquet ultricies metus, augue turpis vulputa
te dictumst mattis egestas laoreet, cubilia habitant magnis lacinia vivamus etiam aenean.
Sagittis vivamus sem morbi nam mattis phasellus vehicula facilisis suscipit posuere metus, iaculis vestibulum viverra nisl ullamcorper lectus curabitur himenaeos dictumst malesuada tempor, cras maecenas enim est eu turpis hac sociosqu tellus magnis. Sociosqu varius feugiat volutpat justo fames magna malesuada, viverra neque nibh parturient eu nascetur, cursus sollicitudin placerat lobortis nunc imperdiet. Leo lectus euismod morbi placerat pretium aliquet ultricies metus, augue turpis vulputa
te dictumst mattis egestas laoreet, cubilia habitant magnis lacinia vivamus etiam aenean.Lorem ipsum dolor sit amet consectetur adipiscing elit donec, gravida commodo hac non mattis augue duis vitae inceptos, laoreet taciti at vehicula cum arcu dictum. Cras netus vivamus sociis pulvinar est erat, quisque imperdiet velit a justo maecenas, pretium gravida ut himenaeos nam. Tellus quis libero sociis class nec hendrerit, id proin facilisis praesent bibendum vehicula tristique, fringilla augue vitae primis turpis.
Sagittis vivamus sem morbi nam mattis phasellus vehicula facilisis suscipit posuere metus, iaculis vestibulum viverra nisl ullamcorper lectus curabitur himenaeos dictumst malesuada tempor, cras maecenas enim est eu turpis hac sociosqu tellus magnis. Sociosqu varius feugiat volutpat justo fames magna malesuada, viverra neque nibh parturient eu nascetur, cursus sollicitudin placerat lobortis nunc imperdiet. Leo lectus euismod morbi placerat pretium aliquet ultricies metus, augue turpis vulputa
te dictumst mattis egestas laoreet, cubilia habitant magnis lacinia vivamus etiam aenean.
Sagittis vivamus sem morbi nam mattis phasellus vehicula facilisis suscipit posuere metus, iaculis vestibulum viverra nisl ullamcorper lectus curabitur himenaeos dictumst malesuada tempor, cras maecenas enim est eu turpis hac sociosqu tellus magnis. Sociosqu varius feugiat volutpat justo fames magna malesuada, viverra neque nibh parturient eu nascetur, cursus sollicitudin placerat lobortis nunc imperdiet. Leo lectus euismod morbi placerat pretium aliquet ultricies metus, augue turpis vulputa
te dictumst mattis egestas laoreet, cubilia habitant magnis lacinia vivamus etiam aenean.
Sagittis vivamus sem morbi nam mattis phasellus vehicula facilisis suscipit posuere metus, iaculis vestibulum viverra nisl ullamcorper lectus curabitur himenaeos dictumst malesuada tempor, cras maecenas enim est eu turpis hac sociosqu tellus magnis. Sociosqu varius feugiat volutpat justo fames magna malesuada, viverra neque nibh parturient eu nascetur, cursus sollicitudin placerat lobortis nunc imperdiet. Leo lectus euismod morbi placerat pretium aliquet ultricies metus, augue turpis vulputa
te dictumst mattis egestas laoreet, cubilia habitant magnis lacinia vivamus etiam aenean.
"""

/// Bundles all meal related
struct DetailMealView: View {
    var meal: Meal
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showDeleteDialog = false
    
    var body: some View {
        if meal.name != nil {
            VStack {
                CustomScrollView(
                    bgImage: UIImage(
                        data: (
                            meal.img
                                ?? UIImage(named: "Placeholder")?
                                    .jpegData(compressionQuality: 1)
                        )!
                    )!
                ) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(meal.name!)
                            .font(.avenirNext(size: 28).bold()).multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Text(meal.notes ?? "... ist auch ohne Beschreibung ein gutes Rezept.")
                            .font(.avenirNext(size: 19)).multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Button(action: {
                            //code
                        }) {
                            HStack {
                                Image(systemName: "calendar.badge.plus")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                Text("ZUM PLAN HINZUFÜGEN")
                                    .bold()
                                    .font(.avenirNext(size: 16))
                            }
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .cornerRadius(7)
                        }
                        .padding(.top, 10)
                        
                        Button(action: {
                            //code
                        }) {
                            HStack {
                                Image(systemName: "book")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                Text("SCHRITTE ANZEIGEN")
                                    .bold()
                                    .font(.avenirNext(size: 16))
                            }
                            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .cornerRadius(7)
                        }
                        .padding(.bottom, 10)
                        
                        Divider().frame(height: 2).background(Color.white)
                        
                    }
                    .padding(.horizontal, 15.0)
                        
                    Text("PORTIONEN")
                        .padding(.leading, 15)
                        .font(.avenirNext(size: 18).bold())
                        .frame(width: 380, height: 40, alignment: .leading).background(Color(UIColor.darkGray).opacity(0.3))
                    
                    Text("ZUTATEN")
                        .padding(.leading, 15)
                        .font(.avenirNext(size: 18).bold())
                        .frame(width: 380, height: 40, alignment: .leading).background(Color(UIColor.darkGray).opacity(0.3))
                    
                    
                    VStack {
                        Text("NOTIZEN")
                            .padding(.leading, 15)
                            .font(.avenirNext(size: 18).bold())
                            .frame(width: 380, height: 40, alignment: .leading).background(Color(UIColor.darkGray).opacity(0.3))
                        Text("Füge deinem Rezept eine Notiz hinzu, indem du es bearbeitest.").padding(.leading, 15).padding(.top, 5)
                            .font(.avenirNext(size: 16)).multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                        
                        
                    VStack {
                        Text("NÄHRWERTE")
                            .padding(.leading, 15)
                            .font(.avenirNext(size: 18).bold())
                            .frame(width: 380, height: 40, alignment: .leading).background(Color(UIColor.darkGray).opacity(0.3))
                        HStack {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        .frame(width: 250, alignment: .center)
                    }
                        /*HStack {
                            Image("Placeholder")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                            
                            VStack(alignment: .leading) {
                                Text("Article Written By")
                                    .font(.avenirNext(size: 12))
                                    .foregroundColor(.gray)
                                Text("Brandon Baars")
                                    .font(.avenirNext(size: 17))
                            }
                        }
                        
                        Text("02 January 2019 • 5 min read")
                            .font(.avenirNextRegular(size: 12))
                            .foregroundColor(.gray)
                        
                        */
                        
                        //Text(loremIpsum)
                        
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                    }).sheet(isPresented: .constant(false)) {
                        //ContentView()
                    }
                    
                    Button(action: {
                        showDeleteDialog = true
                    }, label: {
                        Image(systemName: "trash")
                            .imageScale(.large)
                    })
                }
            }
            .alert(isPresented: $showDeleteDialog) {
                Alert(
                    title: Text("Are you sure"),
                    message: Text("Do you really want to delete \"\(meal.name!)\""),
                    primaryButton: .destructive(Text("Delete")) {
                        // deletes a meal from core data
                        viewContext.delete(meal)
                        do {
                            // saved the context
                            try viewContext.save()
                            self.presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

struct DetailMealView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMealView(meal: Meal())
    }
}
