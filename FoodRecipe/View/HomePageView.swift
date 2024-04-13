//
//  ContentView.swift
//  FoodRecipe
//
//  Created by PavunRaj on 12/04/24.
//

import SwiftUI
import URLImage
struct HomePageView: View {
    @StateObject var recipeViewModel = RecipeViewModel()
    var body: some View {
        
        NavigationStack {
            
            TabView {
                List {
                    ForEach(recipeViewModel.recipe) { recipe in
                        
                        HStack(alignment:.top,spacing:10) {
                            
                            
                            ZStack(alignment: .topLeading) {
                                AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(10)
                                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 8)
                                    
                                } placeholder: {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                        .padding()
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .cornerRadius(10)
                                }
                                
                                .frame(width: 110,height: 110)
                                
                                
                                Button(action: {
                                    print("Button tapped")
                                }) {
                                    
                                    Text("ADD")
                                        .fontWeight(.bold)
                                        .frame(width: 80,height: 30,alignment: .center)
                                        .foregroundColor(.green)
                                        .background(Color.white)
                                        .clipShape(Rectangle())
                                        .cornerRadius(5)
                                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 8)
                                        .offset(x: 5, y: 90)
                                }
                                .padding(.top, 5)
                                .frame(minWidth: 100)
                            }
                            
                            
                            VStack(alignment:.leading,spacing: 5) {
                                Text(recipe.name ?? "")
                                    .fontWeight(.bold)
                                    .lineLimit(2)
                                Text(recipe.cuisine ?? "" )
                                    .fontWeight(.semibold)
                                
                                HStack(alignment:.top,spacing: 5) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.green)
                                    Text(String(recipe.rating ?? 0.0))
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                    Text("(\(String(recipe.reviewCount ?? 0)))")
                                        .fontWeight(.light)
                                    
                                }
                                
                                Text("Size: \(recipe.difficulty?.rawValue ?? "")")
                                HStack(alignment:.top) {
                                    ForEach(recipe.mealType ?? [], id: \.self) { type in
                                        Text(type)
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                }
                .tabItem {
                       Image(systemName: "frying.pan.fill")
                       Text("Food")
                    
                   }
                
                ProfilePage()

                .tabItem {
                       Image(systemName: "person.circle.fill")
                       Text("Profile")
                    
                   }
            }
            .accentColor(.black)
            
          
            .navigationTitle("Recommended (\(recipeViewModel.recipe.count))")
            .navigationBarTitleDisplayMode(.automatic)

        }
        .navigationBarHidden(false)


        .onAppear {
            recipeViewModel.APIRequest()

        }

    
    }
    
}

#Preview {
    HomePageView()

}


