//
//  ProfileModel.swift
//  MyCartProject
//
//  Created by Onqanet on 17/07/25.
//

import Foundation



struct ProfileModel {
    let serviceImg: String
    let serviceName: String
    let btnName: String
}



let profileCount:[ProfileModel] = [
    ProfileModel(serviceImg: "edit", serviceName: "Edit Profile", btnName: "chevron.forward"),
    ProfileModel(serviceImg: "address", serviceName: "Your Address", btnName: "chevron.forward"),
    ProfileModel(serviceImg: "box", serviceName: "My Orders", btnName: "chevron.forward")
]



