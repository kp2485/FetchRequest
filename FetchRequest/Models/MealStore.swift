//
//  MealStore.swift
//  FetchRequest
//
//  Created by Kyle Peterson on 5/1/23.
//

//import Foundation
//
//class MealStore: ObservableObject {
//    func getMealsByCategory(_ category: Category) async throws -> Meal {
//        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)") else { fatalError("Missing URL") }
//
//        let urlRequest = URLRequest(url: url)
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching data") }
//        let decodedData = try JSONDecoder().decode(Meal.self, from: data)
//
//        return decodedData
//    }
//
//    func getMealDetail(_ id: Int) async throws -> Meal {
//        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { fatalError("Missing URL") }
//
//        let urlRequest = URLRequest(url: url)
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching data") }
//        let decodedData = try JSONDecoder().decode(Meal.self, from: data)
//
//        return decodedData
//    }
//}
