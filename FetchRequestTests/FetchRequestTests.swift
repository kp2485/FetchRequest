//
//  FetchRequestTests.swift
//  FetchRequestTests
//
//  Created by Kyle Peterson on 5/3/23.
//

import XCTest
import SwiftUI
@testable import FetchRequest


final class FetchRequestTests: XCTestCase {

    func testCategoryViewModel() async throws {
            let vm = CategoryViewModel()
            vm.selectedCategory = MealCategory.Dessert
            try await vm.getMealsByCategory()
            XCTAssertNotNil(vm.meals)
            XCTAssert(vm.meals!.count > 0)
    }
    
    func testDetailView() async throws {
            let vm = DetailViewModel()
            let id = "53049"
            try await vm.getMealDetail(id)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertNotNil(vm.meals)
            XCTAssertEqual(vm.meals![0].name, "Apam balik")
        }
    }
}
