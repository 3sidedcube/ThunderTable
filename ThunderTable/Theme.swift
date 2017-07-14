//
//  Theme.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 05/10/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import Foundation

/// Defines the default Theme which can be set on `ThemeManager`
@objc(TSCTheme)
open class Theme: NSObject {
    
    ///---------------------------------------------------------------------------------------
    /// - name Colours
    ///---------------------------------------------------------------------------------------
    
    //MARK: Colours
    
    /// The main tint colour for the app. This colour is generally used as the window tint colour and for tinting any UI elements throughout the app such as images and navigation bars
    open var mainColor: UIColor = UIColor(red: 0.894, green: 0.000, blue: 0.010, alpha: 1.0)
    
    /// The background colour for all table view cells throughout the app
    open var cellBackgroundColor: UIColor = UIColor.white
    
    /// The title colour to be used for all table view cells throughout the app
    open var cellTitleColor: UIColor = UIColor.black
    
    /// The detail colour to be used for all table view cells throughout the app
    open var cellDetailColor: UIColor = UIColor.darkText
    
    /// The paragraph style for cell title label
    open var cellTitleParagraphStyle: NSParagraphStyle?
    
    ///The paragraph style for cell detail label
    open var cellDetailParagraphStyle: NSParagraphStyle?
    
    /// A secondary colour that compliments the main colour.
    open var secondaryColor: UIColor = UIColor(white: 0.25, alpha: 1.0)
    
    /// The colour of backgrounds throughout the app, particularly in table views
    open var backgroundColor: UIColor = UIColor.groupTableViewBackground
    
    /// The standard colour for free text
    open var freeTextColor: UIColor {
        return mainColor
    }
    
    /// The colour of header text in the app
    open var headerTextColor: UIColor = UIColor.black
    
    /// The colour of UITableViewCell seperators
    open var tableSeperatorColor: UIColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1.0)
    
    /// The colour of the text for UILabel's throughout the app
    open var primaryLabelColor: UIColor = UIColor.black
    
    /// The colour of the text for alternative UILabel's throughout the app
    open var secondaryLabelColor: UIColor = UIColor.lightGray
    
    /// The colour to be used for title text in a UINavigationBar
    open var titleTextColor: UIColor = UIColor.black
    
    /// The colour of the text label in a disabled UITableViewCell
    open var disabledCellTextColor: UIColor = UIColor(white: 0.6, alpha: 0.6)
    
    /// A red colour
    open var redColor: UIColor = UIColor.red
    
    /// A yellow colour
    open var yellowColor: UIColor = UIColor.yellow
    
    /// A green colour
    open var greenColor: UIColor = UIColor.green
    
    /// A blue colour
    open var blueColor: UIColor = UIColor.blue
    
    /// A dark blue colour
    open var darkBlueColor: UIColor = UIColor(red: 5.0/255.0, green: 56.0/255.0, blue: 115.0/255.0, alpha: 1.0)
    
    /// The colour to be used in the track of UIProgressBar
    open var progressTrackTintColour: UIColor = UIColor(white: 0.683, alpha: 1.0)
    
    /// The colour to be used for a UIProgressBar fill colour
    open var progressTintColour: UIColor = UIColor.white
    
    /// The colour to be used as the navigation bar background colour
    open var navigationBarBackgroundColor: UIColor {
        return mainColor
    }
    
    /// The colour to be used as the navigation bar tint colour
    open var navigationBarTintColor: UIColor = UIColor.white
    
    ///---------------------------------------------------------------------------------------
    /// @name Fonts
    ///---------------------------------------------------------------------------------------
    
    /// Where a lighter font is required, this method will return a light font with the given size
    ///
    /// - parameter ofSize: The required font size
    ///
    /// - returns:  A light font in the requested size
    open func lightFont(ofSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: ofSize, weight: UIFontWeightLight)
    }
    
    /// Returns a font of a required size
    ///
    /// - parameter ofSize: The required font size
    ///
    /// - returns: A font in the requested size
    open func font(ofSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: ofSize, weight: UIFontWeightRegular)
    }
    
    /// Returns a medium font of a required size
    ///
    /// - parameter ofSize: The required font size
    ///
    /// - returns: A medium font in the requested size
    open func mediumFont(ofSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: ofSize, weight: UIFontWeightMedium)
    }
    
    /// Returns a bold font of a required size
    ///
    /// - parameter ofSize: The required font size
    ///
    /// - returns: A bold font in the requested size
    open func boldFont(ofSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: ofSize, weight: UIFontWeightBold)
    }
    
    /// The font for UILabel's throughout the app
    open var primaryLabelFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    
    /// The font for alternative style UILabel's throught the app
    open var secondaryLabelFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    
    /// The font for the title label of cells throughout the app
    open var cellTitleFont: UIFont = UIFont.preferredFont(forTextStyle: .body)
        
    /// The font for the detail label of cells throughout the app
    open var cellDetailFont: UIFont = UIFont.preferredFont(forTextStyle: .caption1)

}

/// A controller for managing the theme of the app
@objc(TSCThemeManager)
open class ThemeManager: NSObject {
    
    /// The theme to be used by the app to style all UIs
    public var theme: Theme = Theme()
    
    /// The shared instance theme manager
    public static let shared = ThemeManager()
    
    private override init() {
        
    }
    
    /// Applies styling to the app, including navigation styling e.t.c.
    public class func customiseApp() {
        
        let theme = ThemeManager.shared.theme

        let navBar = UINavigationBar.appearance()
        navBar.tintColor = theme.mainColor
        
        let toolBar = UIToolbar.appearance()
        toolBar.tintColor = theme.mainColor
        
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = theme.mainColor

        let `switch` = UISwitch.appearance()
        `switch`.onTintColor = theme.mainColor
    }
}
