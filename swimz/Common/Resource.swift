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
    enum FontWeight {
        case black
        case bold
        case semibold
        case regular
        
        var fontWeight: UIFont.Weight {
            switch self {
            case .black: return .black
            case .bold: return .bold
            case .semibold: return .semibold
            case .regular: return .regular
            }
        }
    }
    
    enum Colors {
        // static let primary: UIColor = .init(rgb: 0xef8947)
        static let primary: UIColor = .init(rgb: 0x5EBFD2)
        static let secondary: UIColor = .init(rgb: 0x87D1DE)
        static let tertiary: UIColor = .init(rgb: 0xB7DFE9)
        static let lavender: UIColor = .init(rgb: 0xE6E6F0)
        static let transparentBlack: UIColor = .init(rgb: 0x000000, alpha: 0.3)
        static let black: UIColor = .init(rgb: 0x000000)
        static let darkGray: UIColor = .init(rgb: 0x4c4c4c)
        static let gray: UIColor = .init(rgb: 0x828282)
        static let lightGray: UIColor = .init(rgb: 0xcdcdcd)
        static let white: UIColor = .init(rgb: 0xffffff)
    }
    
    enum Fonts {
        static let mainTitle: UIFont = .init(name: "FasterOne-Regular", size: 50)!
        static let button = Resource.customFont(ofSize: 16, weight: .black)
        static let bold16 = Resource.customFont(ofSize: 16, weight: .bold)
        static let bold15 = Resource.customFont(ofSize: 15, weight: .bold)
        static let bold14 = Resource.customFont(ofSize: 14, weight: .bold)
        static let bold13 = Resource.customFont(ofSize: 13, weight: .bold)
        static let semiBold16 = Resource.customFont(ofSize: 16, weight: .semibold)
        static let semiBold15 = Resource.customFont(ofSize: 15, weight: .semibold)
        static let semiBold14 = Resource.customFont(ofSize: 14, weight: .semibold)
        static let semiBold13 = Resource.customFont(ofSize: 13, weight: .semibold)
        static let regular16 = Resource.customFont(ofSize: 16, weight: .regular)
        static let regular15 = Resource.customFont(ofSize: 15, weight: .regular)
        static let regular14 = Resource.customFont(ofSize: 14, weight: .regular)
        static let regular13 = Resource.customFont(ofSize: 13, weight: .regular)
        
        /// 리소스 변경 전 사용했던 폰트셋
        // static let mainTitle: UIFont = .systemFont(ofSize: 42, weight: .black)
        // static let button: UIFont = .systemFont(ofSize: 16, weight: .black)
        // static let bold16: UIFont = .systemFont(ofSize: 16, weight: .bold)
        // static let bold15: UIFont = .systemFont(ofSize: 15, weight: .bold)
        // static let bold14: UIFont = .systemFont(ofSize: 14, weight: .bold)
        // static let bold13: UIFont = .systemFont(ofSize: 13, weight: .bold)
        // static let semiBold16: UIFont = .systemFont(ofSize: 16, weight: .semibold)
        // static let semiBold15: UIFont = .systemFont(ofSize: 15, weight: .semibold)
        // static let semiBold14: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        // static let semiBold13: UIFont = .systemFont(ofSize: 13, weight: .semibold)
        // static let regular16: UIFont = .systemFont(ofSize: 13, weight: .regular)
        // static let regular15: UIFont = .systemFont(ofSize: 13, weight: .regular)
        // static let regular14: UIFont = .systemFont(ofSize: 13, weight: .regular)
        // static let regular13: UIFont = .systemFont(ofSize: 13, weight: .regular)
    }
    
    enum Images {
        static let profiles: [UIImage] = [
            .profile0, .profile1, .profile2, .profile3, .profile4, .profile5,
            .profile6, .profile7, .profile8, .profile9, .profile10, .profile11
        ]
        
        static let empty: UIImage = .cart
        static let launch: UIImage = .swimzlogo
    }
    
    enum SystemImages {
        static let search = UIImage(systemName: "magnifyingglass")!
        static let clock = UIImage(systemName: "clock")!
        static let person = UIImage(systemName: "person")!
        static let xmark = UIImage(systemName: "xmark")!
        static let left = UIImage(systemName: "chevron.left")!
        static let right = UIImage(systemName: "chevron.right")!
        static let camara = UIImage(systemName: "camera.fill")!
        static let like = UIImage(systemName: "heart")!
        static let likeSelected = UIImage(systemName: "arrow.down.heart.fill")!
        static let likeUnselected = UIImage(systemName: "arrow.down.heart")!
        static let plus = UIImage(systemName: "plus.app")!
    }
    
    // 커스텀 폰트 변환 함수
    static func customFont(ofSize size: CGFloat, weight: FontWeight) -> UIFont {
        let fontName = "GowunDodum-Regular"
        
        guard let customFont = UIFont(name: fontName, size: size) else {
            return UIFont.systemFont(ofSize: size, weight: weight.fontWeight)
        }
        
        if weight == .bold || weight == .black {
            return UIFont(descriptor: customFont.fontDescriptor.withSymbolicTraits(.traitBold) ?? customFont.fontDescriptor, size: size)
        } else if weight == .semibold {
            return UIFont(descriptor: customFont.fontDescriptor.withSymbolicTraits(.traitBold) ?? customFont.fontDescriptor, size: size * 0.95) // Semibold 효과를 위해 약간 조정
        } else {
            return customFont
        }
    }
}
