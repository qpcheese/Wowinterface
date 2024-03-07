# Shadowed Unit Frames

## [v4.4.7](https://github.com/Nevcairiel/ShadowedUnitFrames/tree/v4.4.7) (2024-02-23)
[Full Changelog](https://github.com/Nevcairiel/ShadowedUnitFrames/compare/v4.4.6...v4.4.7) [Previous Releases](https://github.com/Nevcairiel/ShadowedUnitFrames/releases)

- Update TOC  
-  Use high-quality class icon atlas  
- Update STAGGER\_STATES global for 10.2  
    10.2 added a new table-type global `STAGGER\_STATES` to replace the old decimal variables like `STAGGER\_RED\_TRANSITION`. These are now undefined (causing lua errors + stagger bar color doesn't work).  
    This commit updates SUF to get stagger thresholds in the [same way official UI code does](https://github.com/Gethe/wow-ui-source/blob/d4aa41ee5366c48fa8a04b9263afec45415c34d2/Interface/FrameXML/MonkStaggerBar.lua#L35).  
- Remove CheckInteractDistance from range checker, as its protected now  
- Fix Ready Check indicator display  
