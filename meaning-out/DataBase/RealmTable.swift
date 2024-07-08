//
//  LikeItemTable.swift
//  meaning-out
//
//  Created by junehee on 7/7/24.
//

import Foundation
import RealmSwift

// 찜한 아이템 카테고리
class LikeCategory: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var regDate: Date
    @Persisted var detailData: List<LikeItem>
    
    convenience init(name: String, regDate: Date) {
        self.init()
        self.title = name
        self.regDate = regDate
    }
}

// 찜한 아이템
class LikeItem: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String
    @Persisted var lprice: String
    @Persisted var mallName: String
    @Persisted var image: String
    @Persisted var link: String
    @Persisted var isLike: Bool
    
    convenience init(item: Shopping) {
        self.init()
        self.id = item.productId
        self.title = item.title
        self.lprice = item.lprice
        self.mallName = item.mallName
        self.image = item.image
        self.link = item.link
        self.isLike = true
    }
}