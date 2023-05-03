//
//  DetailView.swift
//  FetchRequest
//
//  Created by Kyle Peterson on 5/1/23.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var vm = DetailViewModel()

    var id: String
    
    var body: some View {
        ScrollView {
            if vm.meals == nil {
                ProgressView()
                    .onAppear {
                        Task {
                            do {
                                try await vm.getMealDetail(id)
                            } catch {
                                print("Error loading category")
                            }
                        }
                    }
            } else {
                recipe
            }
            Spacer()
        }
    }
    
    var recipe: some View {
        VStack {
            Text(vm.meals?[0].name ?? "Default Name")
                .font(.title)
                .bold()
            Group {
                AsyncImage(url: URL(string: (vm.meals?[0].imageLocation)!)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 30)
                } placeholder: {
                    LoadingView()
                }

                Text("Category: \((vm.meals?[0].category!.rawValue) ?? "Unknown")")
                Text("Nationality: \(vm.meals?[0].area ?? "Unknown")")
                Text("Ingredients")
                    .font(.title2)
                    .underline()
                
                ForEach(ingredients, id: \.self) { ingredientRow in
                    HStack {
                        Text(ingredientRow.measure)
                        Text(ingredientRow.ingredient)
                    }
                }
                
            }
            .padding(1)
        }
    }
    
    struct IngredientRow: Hashable {
        let ingredient: String
        let measure: String
    }
    
    var ingredients: [IngredientRow] {
        [
            IngredientRow(ingredient: vm.meals?[0].ingredient1 ?? "", measure: vm.meals?[0].measure1 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient2 ?? "", measure: vm.meals?[0].measure2 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient3 ?? "", measure: vm.meals?[0].measure3 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient4 ?? "", measure: vm.meals?[0].measure4 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient5 ?? "", measure: vm.meals?[0].measure5 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient6 ?? "", measure: vm.meals?[0].measure6 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient7 ?? "", measure: vm.meals?[0].measure7 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient8 ?? "", measure: vm.meals?[0].measure8 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient9 ?? "", measure: vm.meals?[0].measure9 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient10 ?? "", measure: vm.meals?[0].measure10 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient11 ?? "", measure: vm.meals?[0].measure11 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient12 ?? "", measure: vm.meals?[0].measure12 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient13 ?? "", measure: vm.meals?[0].measure13 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient14 ?? "", measure: vm.meals?[0].measure14 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient15 ?? "", measure: vm.meals?[0].measure15 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient16 ?? "", measure: vm.meals?[0].measure16 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient17 ?? "", measure: vm.meals?[0].measure17 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient18 ?? "", measure: vm.meals?[0].measure18 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient19 ?? "", measure: vm.meals?[0].measure19 ?? ""),
            IngredientRow(ingredient: vm.meals?[0].ingredient20 ?? "", measure: vm.meals?[0].measure20 ?? "")
        ]
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: "53062")
    }
}
