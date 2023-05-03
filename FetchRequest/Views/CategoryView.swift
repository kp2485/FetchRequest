//
//  CategoryView.swift
//  FetchRequest
//
//  Created by Kyle Peterson on 5/1/23.
//

import SwiftUI

struct CategoryView: View {
    
    @ObservedObject var vm: CategoryViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.meals ?? vm.errorMeals) { meal in
                    NavigationLink {
                        DetailView(id: meal.id)
                    } label: {
                        Text(meal.name)
                    }
                }
            }
        }
    }
}
