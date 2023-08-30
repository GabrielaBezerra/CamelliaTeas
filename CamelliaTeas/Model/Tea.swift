//
//  Tea.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation

struct Tea: Model {
    let id = UUID()
    let name: String
    let pictureURL: URL
    let description: String
    let brewTime: Int
    let foodComplement: String
}

extension Tea: Encodable {
    enum CodingKeys: CodingKey {
        case name
        case brewTime
        case foodComplement
    }
    
    func toDict() -> [String: Any] {
        let data = try! JSONEncoder().encode(self)
        let dict = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
        return dict
    }
}

extension Tea {
    
    static func tea(named name: String) -> Tea {
        Tea.all.first { $0.name == name }!
    }
    
    static let all = [
        Tea(
            name: "Black Tea",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/1a/Black_Tea_from_Kerala_IMG_20200924_201237.jpg")!,
            description: "Black tea is a fully oxidized tea made from Camellia sinensis leaves. It has a strong flavor and dark color due to the complete oxidation process. Common varieties include Assam, Darjeeling, and Earl Grey.",
            brewTime: 3,
            foodComplement: "Black tea pairs well with hearty foods like pastries, breakfast items, and rich desserts."
        ),
        
        Tea(
            name: "Green Tea",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/36/Green_tea_3_appearances.jpg")!,
            description: "Green tea is made from Camellia sinensis leaves that are minimally oxidized. It has a fresh and grassy flavor with a light green color. Popular varieties include Sencha, Matcha, and Gunpowder.",
            brewTime: 2,
            foodComplement: "Green tea goes well with light and savory dishes, sushi, salads, and seafood."
        ),
        
        Tea(
            name: "White Tea",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/9/94/Bai_Hao_Yinzhen_or_Silver_needle_White_Tea.JPG")!,
            description: "White tea is made from young Camellia sinensis leaves and buds. It is minimally processed and has a delicate flavor with subtle floral notes. Silver Needle and Bai Mu Dan are well-known white tea varieties.",
            brewTime: 4,
            foodComplement: "White tea pairs nicely with light and delicate foods, such as fruits, salads, and mild cheeses."
        ),
        
        Tea(
            name: "Oolong Tea",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/48/Tieguanyin2.jpg")!,
            description: "This is a traditional semi-oxidized Chinese tea (Camellia sinensis) produced through a process including withering the plant under strong sun and oxidation before curling and twisting. Most oolong teas, especially those of fine quality, involve unique tea plant cultivars that are exclusively used for particular varieties. The degree of oxidation, which varies according to the chosen duration of time before firing, can range from 8 to 85%, depending on the variety and production style. Oolong is especially popular in south China and among ethnic Chinese in Southeast Asia as is the Fujian preparation process known as the gongfu tea ceremony.",
            brewTime: 5,
            foodComplement: "Oolong tea pairs with light seafood, roasted vegetables, poultry, dim sum, and even certain cheeses. The floral and slightly fruity notes in oolong tea can complement a range of flavors."
        ),
        
        Tea(
            name: "Pu-erh",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/82/%22Da_Yi_Gong_Tuo%22_Pu-erh_shou_cha%2C_2010.jpg")!,
            description: "Pu-erh tea is a fermented tea made from aged Camellia sinensis leaves. It has a rich and earthy flavor profile, with some varieties improving in taste over time. Pu-erh tea is often compressed into cakes or bricks for aging.",
            brewTime: 5,
            foodComplement: "Pu-erh tea complements hearty and rich dishes, and is sometimes enjoyed with dim sum or other savory foods."
        ),
        
        Tea(
            name: "Jasmine Tea",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/15/Jasmine_Flower_Tea.jpg")!,
            description: "Jasmine tea is made by scenting Camellia sinensis leaves with jasmine blossoms. The result is a fragrant and floral tea with a delicate flavor. It's a popular choice in Chinese cuisine.",
            brewTime: 3,
            foodComplement: "Jasmine tea pairs well with Asian cuisine, particularly dishes like sushi, dumplings, and stir-fries."
        ),
        
        Tea(
            name: "Yellow Tea",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/6e/Yellow_tea.jpg")!,
            description: "Yellow tea is a rare and delicate variety made from slightly oxidized Camellia sinensis leaves. It has a milder flavor than green tea and is often associated with a sweet and grassy taste.",
            brewTime: 2,
            foodComplement: "Yellow tea pairs nicely with light seafood dishes, vegetable-based meals, and delicate pastries."
        ),
        
        Tea(
            name: "Longjing Tea (Dragon Well)",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/9/9e/Longjing_tea_leaves.jpg")!,
            description: "Longjing tea is a famous green tea from China, known for its flat, sword-shaped leaves. It has a fresh and nutty flavor with a hint of chestnut sweetness. This tea is often pan-fired to stop oxidation.",
            brewTime: 2,
            foodComplement: "Longjing tea goes well with light Chinese dishes, such as steamed fish, poultry, and vegetable stir-fries."
        ),
        
        Tea(
            name: "Ceylon Tea",
            pictureURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/22/Japanese_Box_of_100%25_Pure_Ceylon_Tea.jpg")!,
            description: "Ceylon tea, also known as Sri Lankan tea, is a black tea produced in Sri Lanka. It has a bold and brisk flavor, often with citrusy and fruity undertones. Ceylon tea is commonly used in blends.",
            brewTime: 3,
            foodComplement: "Ceylon tea pairs well with breakfast foods, pastries, and hearty meals."
        ),
    ]

}
