import Foundation

extension Bundle {

    /// Bundles registered by downstream packages so ThunderTable can find their
    /// cell xibs. SPM puts each package's resources in a separate generated
    /// bundle that is only accessible from inside that package via
    /// `Bundle.module`, and `Bundle(for: cellClass)` resolves to the linked
    /// binary's bundle (the app's main bundle for static libraries) which
    /// usually does not contain the xib. Downstream packages should call
    /// `Bundle.registerThunderTableBundle(.module)` once at startup so their
    /// cell xibs become discoverable.
    private static var registeredThunderTableBundles: [Bundle] = []

    /// Register an additional bundle to be searched when looking up a cell's
    /// nib. Safe to call repeatedly; duplicates are ignored.
    public static func registerThunderTableBundle(_ bundle: Bundle) {
        if !registeredThunderTableBundles.contains(where: { $0 === bundle }) {
            registeredThunderTableBundles.append(bundle)
        }
    }

    /// Returns the bundle that should be used to locate a given nib for a cell
    /// class. We try ThunderTable's own module bundle first so the built-in
    /// cells keep working, then any bundle registered by a downstream package,
    /// and finally fall back to the class's own bundle for the legacy
    /// framework case.
    static func thunderTableNibBundle(for cellClass: AnyClass, nibName: String) -> Bundle {
        if Bundle.module.path(forResource: nibName, ofType: "nib") != nil {
            return .module
        }
        for bundle in registeredThunderTableBundles {
            if bundle.path(forResource: nibName, ofType: "nib") != nil {
                return bundle
            }
        }
        return Bundle(for: cellClass)
    }
}
