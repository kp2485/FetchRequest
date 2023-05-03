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
        List {
            ForEach(vm.meals ?? vm.testMeals) { meal in
                Text(meal.name)
            }
        }
    }
}
