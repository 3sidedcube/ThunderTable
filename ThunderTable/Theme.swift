//
//  Theme.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 05/10/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

/// Defines the default Theme which can be set on `ThemeManager`
open class Theme: NSObject {
    
    ///---------------------------------------------------------------------------------------
    /// - name Colours
    ///---------------------------------------------------------------------------------------
    
    //MARK: Colours
    
    /// The main tint colour for the app. This colour is generally used as the window tint colour and for tinting any UI elements throughout the app such as images and navigation bars
    open var mainColor: UIColor {
        return UIAccessibility.isDarkerSystemColorsEnabled ? UIColor(red: 183.0/255.0, green: 24.0/255.0, blue: 41.0/255.0, alpha: 1.0) : UIColor(red: 0.894, green: 0.000, blue: 0.010, alpha: 1.0)
    }
    
    /// The background colour for all table view cells throughout the app
    open var cellBackgroundColor: UIColor {
        return .secondarySystemGroupedBackground
    }
    
    /// The title colour to be used for all table view cells throughout the app
    open var cellTitleColor: UIColor {
        return .label
    }
    
    /// The detail colour to be used for all table view cells throughout the app
    open var cellDetailColor: UIColor {
        return .secondaryLabel
    }
    
    /// The paragraph style for cell title label
    open var cellTitleParagraphStyle: NSParagraphStyle?
    
    ///The paragraph style for cell detail label
    open var cellDetailParagraphStyle: NSParagraphStyle?
    
    /// A secondary colour that compliments the main colour.
    open var secondaryColor: UIColor = UIColor(white: 0.25, alpha: 1.0)
    
    /// The colour of backgrounds throughout the app, particularly in table views
    open var backgroundColor: UIColor {
        return .systemGroupedBackground
    }
    
    /// The standard colour for free text
    open var freeTextColor: UIColor {
        return mainColor
    }
    
    /// The colour of header text in the app
    open var headerTextColor: UIColor {
        return .label
    }
    
    /// The colour of UITableViewCell seperators
    open var tableSeperatorColor: UIColor {
        return UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1.0)
    }
    
    /// The colour of the text for UILabel's throughout the app
    open var primaryLabelColor: UIColor {
        return .label
    }
    
    /// The colour of the text for alternative UILabel's throughout the app
    open var secondaryLabelColor: UIColor {
        return .secondaryLabel
    }
    
    /// The colour to be used for title text in a UINavigationBar
    open var titleTextColor: UIColor {
        return .black
    }
    
    /// The colour of the text label in a disabled UITableViewCell
    open var disabledCellTextColor: UIColor {
        return UIColor(white: 0.6, alpha: 0.6)
    }
    
    //MARK: -
    //MARK: - Standard colours
    //MARK: -
    
    /// A blue colour
    open var blueColor: UIColor {
        return .systemBlue
    }
    
    // A brown colour
    open var brownColor: UIColor {
        return .brown
    }
    
    /// A dark blue colour
    open var darkBlueColor: UIColor {
        return UIColor(red: 5.0/255.0, green: 56.0/255.0, blue: 115.0/255.0, alpha: 1.0)
    }
    
    /// A cyan colour
    open var cyanColor: UIColor {
        return .cyan
    }
    
    /// A dark gray colour
    open var darkGrayColor: UIColor {
        return .darkGray
    }
    
    /// A gray colour
    open var grayColor: UIColor {
        return .systemGray
    }
    
    /// A green colour
    open var greenColor: UIColor {
        return .systemGreen
    }
    
    /// A light gray colour
    open var lightGrayColor: UIColor {
        return .lightGray
    }
    
    /// A magenta colour
    open var magentaColor: UIColor {
        return .magenta
    }
    
    /// An orange colour
    open var orangeColor: UIColor {
        return .systemOrange
    }
    
    // A purple colour
    open var purpleColor: UIColor {
        return .systemPurple
    }
    
    /// A red colour
    open var redColor: UIColor {
        return .systemRed
    }
    
    /// A yellow colour
    open var yellowColor: UIColor {
        return .systemYellow
    }
    
    /// A white colour
    open var whiteColor: UIColor {
        return .white
    }
    
    /// The colour to be used in the track of UIProgressBar
    open var progressTrackTintColour: UIColor {
        return UIAccessibility.isDarkerSystemColorsEnabled ? UIColor(white: 0.583, alpha: 1.0) : UIColor(white: 0.683, alpha: 1.0)
    }
    
    /// The colour to be used for a UIProgressBar fill colour
    open var progressTintColour: UIColor {
        return .white
    }
    
    /// The status bar style to use by default
    open var statusBarStyle: UIStatusBarStyle = .lightContent
    
    /// The colour to be used as the navigation bar background colour
    open var navigationBarBackgroundColor: UIColor {
        return mainColor
    }
    
    /// The colour to be used as the navigation bar tint colour
    open var navigationBarTintColor: UIColor {
        return .white
    }
    
    ///---------------------------------------------------------------------------------------
    /// @name Fonts
    ///---------------------------------------------------------------------------------------
    
    /// Provides a dynamically scaled font given the provided parameters
    ///
    /// - Parameters:
    ///   - size: The font size that the font should render at at default font-scaling
    ///   - textStyle: The text style that should be used to apply dynamic scaling to the font
    ///   - weight: The weight of the desired font
    /// - Returns: A dynamically scaling font adhering to the provided constraints
    open func dynamicFont(ofSize size: CGFloat, textStyle: UIFont.TextStyle, weight: UIFont.Weight = .regular) -> UIFont {
        let baseFont = UIFont.systemFont(ofSize: size, weight: weight)
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        return fontMetrics.scaledFont(for: baseFont)
    }
    
    /// The font for UILabel's throughout the app
    open var primaryLabelFont: UIFont {
        return dynamicFont(ofSize: UIFont.systemFontSize, textStyle: .body)
    }
    
    /// The font for alternative style UILabel's throught the app
    open var secondaryLabelFont: UIFont {
        return dynamicFont(ofSize: UIFont.systemFontSize, textStyle: .body)
    }
    
    /// The font for the title label of cells throughout the app
    open var cellTitleFont: UIFont {
        return dynamicFont(ofSize: 17, textStyle: .body)
    }
    
    /// The font for the detail label of cells throughout the app
    open var cellDetailFont: UIFont {
        return dynamicFont(ofSize: 15, textStyle: .subheadline)
    }
    
}

/// A controller for managing the theme of the app
open class ThemeManager {
    
    /// The theme to be used by the app to style all UIs
    public var theme: Theme = Theme()
    
    /// The shared instance theme manager
    public static let shared = ThemeManager()
    
    private init() {
        
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
