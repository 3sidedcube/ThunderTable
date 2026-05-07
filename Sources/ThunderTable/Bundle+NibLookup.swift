import Foundation

extension Bundle {
    /// Returns the bundle that should be used to locate a given nib for a cell class.
    ///
    /// The package's own xib resources live in the SPM-generated module bundle
    /// (`Bundle.module`); xibs supplied by consumers of the package live in the
    /// bundle that defined the class. We try the module bundle first so the
    /// built-in cells continue to work, and fall back to the class's own bundle
    /// for everything else.
    static func thunderTableNibBundle(for cellClass: AnyClass, nibName: String) -> Bundle {
        if Bundle.module.path(forResource: nibName, ofType: "nib") != nil {
            return .module
        }
        return Bundle(for: cellClass)
    }
}
