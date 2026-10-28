import Foundation

extension Bundle {

    /// Bundles registered by downstream packages so ThunderTable can find their
    /// cell xibs. SPM puts each package's resources in a separate generated
    /// bundle that is only accessible from inside that package via
    /// `Bundle.module`, and `Bundle(for: cellClass)` resolves to the linked
    /// binary's bundle (the app's main bundle for static libraries) which
    /// usually does not contain the xib.
    ///
    /// Registering is optional: `thunderTableNibBundle(for:nibName:)` also finds
    /// a package's resource bundle from the cell class's module name.
    private static var registeredThunderTableBundles: [Bundle] = []

    /// Resource bundles found by module name, cached because the lookup walks
    /// the bundle's directory.
    private static var moduleResourceBundles: [String: Bundle] = [:]

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
    /// then the class's own bundle (the app, or a dynamic framework), then the
    /// SPM resource bundle of the module that declares the class.
    static func thunderTableNibBundle(for cellClass: AnyClass, nibName: String) -> Bundle {
        if Bundle.module.path(forResource: nibName, ofType: "nib") != nil {
            return .module
        }
        for bundle in registeredThunderTableBundles {
            if bundle.path(forResource: nibName, ofType: "nib") != nil {
                return bundle
            }
        }
        let classBundle = Bundle(for: cellClass)
        if classBundle.path(forResource: nibName, ofType: "nib") == nil,
           let moduleBundle = resourceBundle(forModuleOf: cellClass),
           moduleBundle.path(forResource: nibName, ofType: "nib") != nil {
            return moduleBundle
        }
        return classBundle
    }

    /// Returns the SPM resource bundle of the module that declares `aClass`.
    ///
    /// SPM names each target's resource bundle `<Package>_<Target>.bundle` and
    /// places it next to the binary that links the target, which is where the
    /// generated `Bundle.module` accessor looks too.
    static func resourceBundle(forModuleOf aClass: AnyClass) -> Bundle? {
        let className = NSStringFromClass(aClass)
        guard let dotIndex = className.firstIndex(of: ".") else { return nil }
        let moduleName = String(className[..<dotIndex])

        if let cached = moduleResourceBundles[moduleName] {
            return cached
        }

        let suffix = "_\(moduleName).bundle"
        let searchURLs = [Bundle.main.resourceURL, Bundle(for: aClass).resourceURL].compactMap { $0 }
        for url in searchURLs {
            let contents = (try? FileManager.default.contentsOfDirectory(atPath: url.path)) ?? []
            if let name = contents.first(where: { $0.hasSuffix(suffix) }),
               let bundle = Bundle(url: url.appendingPathComponent(name)) {
                moduleResourceBundles[moduleName] = bundle
                return bundle
            }
        }
        return nil
    }
}
