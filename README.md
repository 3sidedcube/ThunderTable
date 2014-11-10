# Thunder Table

Thunder Table is a useful framework which enables quick and easy creation of table views in iOS, making the process of creating complex tables as simple as a few lines of code; and removing the necessity for having long chains of index paths and if statements.

## How It Works

Thunder table comprises of two main types of objects:

### Rows

Table rows are objects that conform to the `TSCTableRowDataSource` protocol, this protocol has properties such as: title, subtitle and image which are responsible for providing the content to a table view cell. As this is a protocol any object can conform to it, which allows you to simply send an array of model objects to the table view to display your content.

### Sections

Table sections are objects that conform to the `TSCTableSectionDataSource` protocol, most of the time you won't need to implement this protocol yourself as Thunder Table has a convenience class TSCTableSection which can be used in most circumstances. However you can implement more complex layouts using this protocol on your own classes.

## Dynamic Cell Heights

Yes. You heard it here first. Thunder Table has an automatic cell height calculation system, so there's no need for constraints auto layout or calculating the height of your text manually.

Cell height is calculated automatically, but if you do wisth to override it you can do so using methods in the `TSCTableSectionDataSource` protocol.

# Installation

Setting up your app to use Thunder Table is a simple and quick process. For now Thunder Table is built as a static framework, meaning you will need to include the whole Xcode project in your workspace.

+ Drag all included files and folders to a location within your existing project.
+ Add ThunderTable.framework to your Embedded Binaries.
+ Wherever you want to use ThunderTable use `@import ThunderTable` or `import ThunderTable` if you're using swift.

# Code Example
## A Simple Table View Controller

Setting up a table view is massively simplified using thunder table, in fact, we can get a simple table view running with just a few lines of code. To create a custom table view we subclass from TSCTableViewController, in the initalizer we determine which tableView style we want by calling the correct `[super init]` method like so:

    - (id)init
    {
    	if (self = [super initWithStyle:UITableViewStyleGrouped]) {
    		
    		// Handle any custom initialisation here.
    	}
    	return self;
    }

We then set up our table in the `viewDidLoad:` method. First we initialise the rows which we want to appear in our table view:

    TSCTableImageRow *userImageRow = [TSCTableImageRow rowWithImage:[UIImage imageNamed:@"Avatar.png"]];
    TSCTableRow *nameRow = [TSCTableRow rowWithTitle:@"Name" subtitle:@"Simon" image:[UIImage imageNamed:@"Avatar_Thumb.png"]];
    TCSTableRow *addressRow = [TSCTableRow rowWithTitle:@"Address" subtitle:@"42 Some Road" image:nil];
    TSCTableRow *editRow = [TSCTableRow rowWithTitle:@"Edit"];
    [editRow addTarget:self selector:@selector(handleEdit:)];
    
We then group our rows into the sections we want to display in our table view:

    TSCTableSection *userSection = [TSCTableSection sectionWithTitle:@"User" footer:nil items@[userImageRow, nameRow, addressRow, editRow]];
    
And then finally we set our tableView's datasource like so:

    self.dataSource = @[userSection];

	
#License
See [LICENSE.md](LICENSE.md)

