//
//  Colors.swift
//  meaning-out
//
//  Created by junehee on 6/14/24.
//

import UIKit

/**
 Colors: 프로젝트에서 사용될 색상
 Fonts: 프로젝트에서 사용되는 폰트
 */

enum Resource {
    enum Colors {
        static let primary: UIColor = .init(rgb: 0xef8947)
        static let black: UIColor = .init(rgb: 0x000000)
        static let darkGray: UIColor = .init(rgb: 0x4c4c4c)
        static let gray: UIColor = .init(rgb: 0x828282)
        static let lightGray: UIColor = .init(rgb: 0xcdcdcd)
        static let white: UIColor = .init(rgb: 0xffffff)
    }
    
    enum Fonts {
        static let mainTitle: UIFont = .systemFont(ofSize: 42, weight: .black)
        static let button: UIFont = .systemFont(ofSize: 16, weight: .black)
    }
    
    enum Images {
        static let launch: UIImage = .launch
    }
    
    enum SystemImages {
        static let search = UIImage(systemName: "magnifyingglass")!
        static let clock = UIImage(systemName: "clock")!
        static let person = UIImage(systemName: "person")!
        static let exit = UIImage(systemName: "xmark")!
        static let left = UIImage(systemName: "chevron.left")!
        static let right = UIImage(systemName: "chevron.right")!
        static let camara = UIImage(systemName: "camera.fill")!
    }
}
