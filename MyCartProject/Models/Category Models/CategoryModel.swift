//
//  CategoryModel.swift
//  MyCartProject
//
//  Created by Onqanet on 08/08/25.
//

import Foundation


struct CategoryModel {
    let productImgName: String
    let productName: String
    let productQuantity: String
    let productRating: String
    let percentOff: String
    let productPrice: String
    let isVeg: Bool
}




let demoCategories:[CategoryModel] = [
    CategoryModel(productImgName: "Bingo_Tedhe_Medhe", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "5", percentOff: "22%", productPrice: "39 ", isVeg: true),
    CategoryModel(productImgName: "Cheetos", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "5", percentOff: "22%", productPrice: "45", isVeg: true),
    CategoryModel(productImgName: "Crax", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "5", percentOff: "27%", productPrice: "75", isVeg: true),
    CategoryModel(productImgName: "Dairy_Milk_Mousse", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "5", percentOff: "27%", productPrice: "80", isVeg: true),
    
    CategoryModel(productImgName: "Dairy_Milk", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "5", percentOff: "25%", productPrice: "", isVeg: true),
    CategoryModel(productImgName: "Kurkure_Img", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "4", percentOff: "22%", productPrice: "45", isVeg: true),
    CategoryModel(productImgName: "Lays", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "4", percentOff: "21%", productPrice: "39", isVeg: true),
    CategoryModel(productImgName: "Uncle_Chips", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "5", percentOff: "22%", productPrice: "38", isVeg: true),
    CategoryModel(productImgName: "Bingo_Tedhe_Medhe", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "5", percentOff: "27%", productPrice: "25", isVeg: true),
    CategoryModel(productImgName: "Cheetos", productName: "Crax Zero Masala Punch Potato Chips", productQuantity: "65 g", productRating: "5", percentOff: "22%", productPrice: "45", isVeg: true),
]


