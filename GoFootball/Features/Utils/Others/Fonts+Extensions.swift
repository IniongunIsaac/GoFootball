//
//  Fonts+Extensions.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import UIKit

func printAvailableFonts() {
    UIFont.familyNames.forEach({ familyName in
        let fontNames = UIFont.fontNames(forFamilyName: familyName)
        print(familyName, fontNames)
    })
}

extension UIFont {
    
    class func nunitoBlack(size: CGFloat = 16) -> UIFont { R.font.nunitoBlack(size: size)! }
    
    class func nunitoBlackItalic(size: CGFloat = 16) -> UIFont { R.font.nunitoBlackItalic(size: size)! }
    
    class func nunitoBold(size: CGFloat = 16) -> UIFont { R.font.nunitoBold(size: size)! }
    
    class func nunitoBoldItalic(size: CGFloat = 16) -> UIFont { R.font.nunitoBoldItalic(size: size)! }
    
    class func nunitoExtraBold(size: CGFloat = 16) -> UIFont { R.font.nunitoExtraBold(size: size)! }
    
    class func nunitoExtraBoldItalic(size: CGFloat = 16) -> UIFont { R.font.nunitoExtraBoldItalic(size: size)! }
    
    class func nunitoExtraLight(size: CGFloat = 16) -> UIFont { R.font.nunitoExtraLight(size: size)! }
    
    class func nunitoExtraLightItalic(size: CGFloat = 16) -> UIFont { R.font.nunitoExtraLightItalic(size: size)! }
    
    class func nunitoItalic(size: CGFloat = 16) -> UIFont { R.font.nunitoItalic(size: size)! }
    
    class func nunitoLight(size: CGFloat = 16) -> UIFont { R.font.nunitoLight(size: size)! }
    
    class func nunitoLightItalic(size: CGFloat = 16) -> UIFont { R.font.nunitoLightItalic(size: size)! }
    
    class func nunitoRegular(size: CGFloat = 16) -> UIFont { R.font.nunitoRegular(size: size)! }
    
    class func nunitoSemiBold(size: CGFloat = 16) -> UIFont { R.font.nunitoSemiBold(size: size)! }
    
    class func nunitoSemiBoldItalic(size: CGFloat = 16) -> UIFont { R.font.nunitoSemiBoldItalic(size: size)! }
    
}
