//
//  Theme.swift
//  ThunderTable
//
//  Created by Simon Mitchell on 05/10/2016.
//  Copyright © 2016 3SidedCube. All rights reserved.
//

import UIKit

/// Defines the default Theme which can be set on `ThemeManager`
@objc(TSCTheme)
open class Theme: NSObject {
    
    ///---------------------------------------------------------------------------------------
    /// - name Colours
    ///---------------------------------------------------------------------------------------
    
    //MARK: Colours
    
    /// The main tint colour for the app. This colour is generally used as the window tint colour and for tinting any UI elements throughout the app such as images and navigation bars
    @objc open var mainColor: UIColor = UIColor(red: 0.894, green: 0.000, blue: 0.010, alpha: 1.0)
    
    /// The background colour for all table view cells throughout the app
    open var cellBackgroundColor: UIColor = .white
    
    /// The title colour to be used for all table view cells throughout the app
    open var cellTitleColor: UIColor = .black
    
    /// The detail colour to be used for all table view cells throughout the app
    open var cellDetailColor: UIColor = .darkText
    
    /// The paragraph style for cell title label
    open var cellTitleParagraphStyle: NSParagraphStyle?
    
    ///The paragraph style for cell detail label
    open var cellDetailParagraphStyle: NSParagraphStyle?
    
    /// A secondary colour that compliments the main colour.
    @objc open var secondaryColor: UIColor = UIColor(white: 0.25, alpha: 1.0)
    
    /// The colour of backgrounds throughout the app, particularly in table views
    @objc open var backgroundColor: UIColor = .groupTableViewBackground
    
    /// The standard colour for free text
    open var freeTextColor: UIColor {
        return mainColor
    }
    
    /// The colour of header text in the app
    open var headerTextColor: UIColor = .black
    
    /// The colour of UITableViewCell seperators
    open var tableSeperatorColor: UIColor = UIColor(red: 0.78, green: 0.78, blue: 0.8, alpha: 1.0)
    
    /// The colour of the text for UILabel's throughout the app
    @objc open var primaryLabelColor: UIColor = .black
    
    /// The colour of the text for alternative UILabel's throughout the app
    @objc open var secondaryLabelColor: UIColor = .lightGray
    
    /// The colour to be used for title text in a UINavigationBar
    @objc open var titleTextColor: UIColor = .black
    
    /// The colour of the text label in a disabled UITableViewCell
    open var disabledCellTextColor: UIColor = UIColor(white: 0.6, alpha: 0.6)
	
	//MARK: -
	//MARK: - Standard colours
	//MARK: -
	
	/// A blue colour
	open var blueColor: UIColor = .blue
	
	// A brown colour
	open var brownColor: UIColor = .brown
	
	/// A dark blue colour
	open var darkBlueColor: UIColor = UIColor(red: 5.0/255.0, green: 56.0/255.0, blue: 115.0/255.0, alpha: 1.0)
	
	/// A cyan colour
	open var cyanColor: UIColor = .cyan
	
	/// A dark gray colour
	open var darkGrayColor: UIColor = .darkGray
	
	/// A gray colour
	open var grayColor: UIColor = .gray
	
	/// A green colour
	open var greenColor: UIColor = .green
	
	/// A light gray colour
	open var lightGrayColor: UIColor = .lightGray
	
	/// A magenta colour
	open var magentaColor: UIColor = .magenta
	
	/// An orange colour
	open var orangeColor: UIColor = .orange
	
	// A purple colour
	open var purpleColor: UIColor = .purple
	
    /// A red colour
    open var redColor: UIColor = .red
    
    /// A yellow colour
    open var yellowColor: UIColor = .yellow
	
	/// A white colour
	open var whiteColor: UIColor = .white
	
    /// The colour to be used in the track of UIProgressBar
    @objc open var progressTrackTintColour: UIColor = UIColor(white: 0.683, alpha: 1.0)
    
    /// The colour to be used for a UIProgressBar fill colour
    @objc open var progressTintColour: UIColor = .white
    
    /// The status bar style to use by default
    open var statusBarStyle: UIStatusBarStyle = .lightContent
    
    /// The colour to be used as the navigation bar background colour
    open var navigationBarBackgroundColor: UIColor {
        return mainColor
    }
    
    /// The colour to be used as the navigation bar tint colour
    open var navigationBarTintColor: UIColor = .white
    
    ///---------------------------------------------------------------------------------------
    /// @name Fonts
    ///---------------------------------------------------------------------------------------
    
    /// Where a lighter font is required, this method will return a light font with the given size
    ///
    /// - parameter ofSize: The required font size
    ///
    /// - returns:  A light font in the requested size
    open func lightFont(ofSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: ofSize, weight: .light)
    }
    
    /// Returns a font of a required size
    ///
    /// - parameter ofSize: The required font size
    ///
    /// - returns: A font in the requested size
    open func font(ofSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: ofSize, weight: .regular)
    }
    
    /// Returns a medium font of a required size
    ///
    /// - parameter ofSize: The required font size
    ///
    /// - returns: A medium font in the requested size
    open func mediumFont(ofSize: CGFloat) -> UIFont {
        return .systemFont(ofSize: ofSize, weight: .medium)
    }
    
    /// Returns a bold font of a required size
    ///
    /// - parameter ofSize: The required font size
    ///
    /// - returns: A bold font in the requested size
    open func boldFont(ofSize: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: ofSize, weight: .bold)
    }
    
    /// The font for UILabel's throughout the app
    open var primaryLabelFont: UIFont = .systemFont(ofSize: UIFont.systemFontSize)
    
    /// The font for alternative style UILabel's throught the app
    open var secondaryLabelFont: UIFont = .systemFont(ofSize: UIFont.systemFontSize)
    
    /// The font for the title label of cells throughout the app
    open var cellTitleFont: UIFont = .preferredFont(forTextStyle: .body)
        
    /// The font for the detail label of cells throughout the app
    open var cellDetailFont: UIFont = .preferredFont(forTextStyle: .subheadline)

}

/// A controller for managing the theme of the app
@objc(TSCThemeManager)
open class ThemeManager: NSObject {
    
    /// The theme to be used by the app to style all UIs
    @objc public var theme: Theme = Theme()
    
    /// The shared instance theme manager
	@objc(sharedManager)
    public static let shared = ThemeManager()
    
    override private init() {
        
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
