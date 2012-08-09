WoolyUIKit
==========

Extensions and add-on classes for iOS UIKit

This is definitely "work in progress", has minimal documentation, and could be considered
quite sparse.

Best if used in conjunction with WoolyFoundation, but not required.

Installation
------------
1. Add WoolyUI.xcodeproj to your current project.
2. Add "WoolyUI.h" to your prefix file.
3. Update project [User] Header Search Paths and target dependencies appropriately.
4. Update Other Linker Flags with '-all_load' in order to work around a bug in Apple's linkers with using static libraries that composed of categories. This may be fixed in future releases of Apple's developer tools: http://developer.apple.com/library/mac/#qa/qa1490/_index.html
