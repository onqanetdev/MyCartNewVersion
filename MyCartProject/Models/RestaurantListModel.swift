//
//  RestaurantListModel.swift
//  MyCartProject
//
//  Created by Onqanet on 11/07/25.
//

import Foundation


struct RestaurantListModel {
    let restaurantCoverImage: String
    let restaurantName: String
    let rating: Float
    let time: Int
    let description: String
    let tags: String
    let location: String
    let isFreeDelivery: Bool
    let benefitDesc: String
    let productPrice: String
}

let restaurantListMockData = [
    RestaurantListModel(restaurantCoverImage: "Food_img1", restaurantName: "Burger Point", rating: 4.0, time: 20, description: "₹200 for two", tags: "Fast Food, American, Combo, Desserts, Beverages", location: "Sector 67", isFreeDelivery: true , benefitDesc: "extra 10% off + free delivery", productPrice: "Rs. 1236 /-"),
    RestaurantListModel(restaurantCoverImage: "Food_img2", restaurantName: "Healthuy Cuisines", rating: 3.5, time: 36, description: "₹249 for two", tags: "Healthy Food, North Indian Chinese, Pizzas", location: "Sector 67", isFreeDelivery: true , benefitDesc: "extra 15% off + free delivery", productPrice: "Rs. 45 /-"),
    RestaurantListModel(restaurantCoverImage: "Food_img3", restaurantName: "Sagar Ratan", rating: 3.8, time: 27, description: "₹400 for two", tags: "South Indian", location: "Sector 80", isFreeDelivery: false , benefitDesc: "", productPrice: "Rs. 500 /-"),
    RestaurantListModel(restaurantCoverImage: "Food_img4", restaurantName: "Sindhi Sweet", rating: 4.1, time: 26, description: "₹300 for two", tags: "North Indian, Sweets, South Indian, Chinese, Chat, Street Food, Continental", location: "Phase 10, Sector 64", isFreeDelivery: true , benefitDesc: "extra 20% off + free delivery", productPrice: "Rs. 129 /-"),
    RestaurantListModel(restaurantCoverImage: "Food_img5", restaurantName: "Captain Sam's Pizza", rating: 4.0, time: 38, description: "₹200 for two", tags: "Pizza, Italian", location: "Phase 10, Sector 64", isFreeDelivery: true , benefitDesc: "free delivery", productPrice: "Rs. 300 /-"),
    RestaurantListModel(restaurantCoverImage: "Food_img2", restaurantName: "Healthuy Cuisines", rating: 3.5, time: 36, description: "₹249 for two", tags: "Healthy Food, North Indian Chinese, Pizzas", location: "Sector 67", isFreeDelivery: true , benefitDesc: "extra 15% off + free delivery", productPrice: "Rs. 798 /-"),
    RestaurantListModel(restaurantCoverImage: "Food_img3", restaurantName: "Sagar Ratan", rating: 3.8, time: 27, description: "₹400 for two", tags: "South Indian", location: "Sector 80", isFreeDelivery: false , benefitDesc: "", productPrice: "Rs. 1000 /-"),
    RestaurantListModel(restaurantCoverImage: "Food_img4", restaurantName: "Sindhi Sweet", rating: 4.1, time: 26, description: "₹300 for two", tags: "North Indian, Sweets, South Indian, Chinese, Chat, Street Food, Continental", location: "Phase 10, Sector 64", isFreeDelivery: true , benefitDesc: "extra 20% off + free delivery", productPrice: "Rs. 567 /-"),
]


