//
//  DetailViewModel.swift
//  FetchRequest
//
//  Created by Kyle Peterson on 5/1/23.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var meals: [DetailedMeal]?
    
    func getMealDetail(_ id: String) async throws {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching data") }
        
        let dataString: String = String(decoding: data, as: UTF8.self)
        
        let filteredDataString = dataString.replacingOccurrences(of: "\\/", with: "/")
        
        guard let filteredData = filteredDataString.data(using: .utf8) else { fatalError("Error converting string back to data") }
        
        do {
            let decodedData = try JSONDecoder().decode(DetailedMeals.self, from: filteredData)
            DispatchQueue.main.async {
                self.meals = decodedData.meals
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
