WoolyUIKit
==========

Extensions and add-on classes for iOS UIKit

This is definitely "work in progress", has minimal documentation, and could be considered
quite sparse.

Best if used in conjunction with WoolyFoundation, but not required.

Please note that none of the category method signatures have been prefixed, so it is possible for a future naming collision if Apple should choose to implement a similar method in UIKit. I will fix this at some point.

Installation
------------
1. Add WoolyUI.xcodeproj to your current project.
2. Add "WoolyUI.h" to your prefix file.
3. Update project [User] Header Search Paths and target dependencies appropriately.
4. Update Other Linker Flags with '-all_load' in order to work around a bug in Apple's linkers with using static libraries that composed of categories. This may be fixed in future releases of Apple's developer tools: http://developer.apple.com/library/mac/#qa/qa1490/_index.html
