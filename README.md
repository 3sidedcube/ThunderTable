# Thunder Table

[![Build Status](https://travis-ci.org/3sidedcube/iOS-ThunderTable.svg)](https://travis-ci.org/3sidedcube/iOS-ThunderTable) [![Swift 5](http://img.shields.io/badge/swift-5-brightgreen.svg)](https://swift.org/blog/swift-5-released/) [![Apache 2](https://img.shields.io/badge/license-Apache%202-brightgreen.svg)](LICENSE.md)

Thunder Table is a useful framework which enables quick and easy creation of table views in iOS, making the process of creating complex tables as simple as a few lines of code; and removing the necessity for having long chains of index paths and if statements.

## How It Works

Thunder table comprises of two main types of objects:

### Rows

Table rows are objects that conform to the `Row` protocol, this protocol has properties such as: title, subtitle and image which are responsible for providing the content to a table view cell. As this is a protocol any object can conform to it, which allows you to simply send an array of model objects to the table view to display your content.

### Sections

Table sections are objects that conform to the `Section` protocol, most of the time you won't need to implement this protocol yourself as Thunder Table has a convenience class `TableSection` which can be used in most circumstances. However you can implement more complex layouts using this protocol on your own classes.

# Installation

Setting up your app to use Thunder Table is a simple.

+ Drag ThunderTable.xcodeproj
+ Add ThunderTable.framework to your Embedded Binaries.
+ Wherever you want to use ThunderTable use `import ThunderTable`

# Code Example
## A Simple Table View Controller

Setting up a table view is massively simplified using thunder table, in fact, we can get a simple table view running with just a few lines of code. To create a custom table view we subclass from `TableViewController`. We then set up our table in the `viewDidLoad:` method. Below is the full code for a table view that displays one row, with text, a subtitle, image and handles table selection by pushing another view.

```
import ThunderTable

class MyTableViewController: TableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageRow = TableRow(title: "Settings", subtitle: "Configure your settings", image: UIImage(named: "settings-cog")) { (row, selected, indexPath, tableView) -> (Void) in
            
            let settings = SettingsViewController()
            self.showDetailViewController(settings, sender: self)
        }
        
        let section = TableSection(rows: [imageRow])
        data = [section]
    }
}
```

# Code level documentation
Documentation is available for the entire library in AppleDoc format. This is available in the framework itself or in the [Hosted Version](http://3sidedcube.github.io/iOS-ThunderTable/)
	
# License
See [LICENSE.md](LICENSE.md)

