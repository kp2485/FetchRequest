//
//  ContentView.swift
//  FetchRequest
//
//  Created by Kyle Peterson on 5/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = CategoryViewModel()

    var body: some View {
        
        VStack {
            
            Menu {
                Picker("Choose a meal category:", selection: $vm.selectedCategory) {
                    ForEach(MealCategory.allCases, id: \.self) { category in
                        Text("\(category.rawValue)")
                            .tag(category)
                    }
                }
            } label: {
                Text("\(vm.selectedCategory.rawValue) Dishes")
                    .font(.largeTitle)
            }
            
            if vm.meals == nil {
                ProgressView()
                    .onAppear {
                        Task {
                            do {
                                try await vm.getMealsByCategory()
                            } catch {
                                print("Error loading category")
                            }
                        }
                    }
            } else {
                CategoryView(vm: vm)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
