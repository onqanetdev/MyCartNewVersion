//
//  NotificationModel.swift
//  MyCartProject
//
//  Created by Onqanet on 30/07/25.
//

import Foundation


struct NotificationModel {
    let orderType: String
    let orderTypeDetails:String
}


let notifications = [
    NotificationModel(orderType: "Order Confirmed", orderTypeDetails: "Your order #12345 has been confirmed and is being prepared."),
    NotificationModel(orderType: "Payment Received", orderTypeDetails: "We have received your payment of 2299.Thank you!"),
    NotificationModel(orderType: "Delivery Update", orderTypeDetails: "Your order is out for delivery. Please be available at the location."),
    NotificationModel(orderType: "Promo Offer", orderTypeDetails: "Get 20% off on your next purchase. Use code: WELCOME20"),
    
    NotificationModel(orderType: "Order Confirmed", orderTypeDetails: "Your order #12345 has been confirmed and is being prepared."),
    NotificationModel(orderType: "Payment Received", orderTypeDetails: "We have received your payment of 2299.Thank you!"),
    NotificationModel(orderType: "Delivery Update", orderTypeDetails: "Your order is out for delivery. Please be available at the location."),
    NotificationModel(orderType: "Promo Offer", orderTypeDetails: "Get 20% off on your next purchase. Use code: WELCOME20"),
]






