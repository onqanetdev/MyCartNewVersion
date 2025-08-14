//
//  AddressItemModel.swift
//  MyCartProject
//
//  Created by Onqanet on 14/08/25.
//

import Foundation


struct AddressItem {
    let id = UUID()
    let type: String // e.g., "Home", "Work"
    let typeIconName: String // SF Symbol name for the icon (e.g., "house.fill", "building.2.fill")
    let name: String
    let fullAddress: String
    let phoneNumber: String
}





 var addresses: [AddressItem] = [
    AddressItem(type: "Home", typeIconName: "house.fill", name: "Subhojit Roy", fullAddress: "Primarc Tower, #903 – 9th Floor, DN – 36 Block, Sector- V, Salt Lake, Kolkata, West Bengal 700091", phoneNumber: "8274005101"),
    AddressItem(type: "Work", typeIconName: "building.2.fill", name: "Amarjit Singh", fullAddress: "Primarc Tower, #903 – 9th Floor, DN – 36 Block, Sector- V, Salt Lake, Kolkata, West Bengal 700091", phoneNumber: "8274005101")
]

