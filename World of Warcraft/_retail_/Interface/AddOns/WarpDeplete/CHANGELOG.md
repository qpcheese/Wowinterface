# WarpDeplete

## [v3.0.2](https://github.com/happenslol/WarpDeplete/tree/v3.0.2) (2024-07-29)
[Full Changelog](https://github.com/happenslol/WarpDeplete/compare/v3.0.1...v3.0.2) [Previous Releases](https://github.com/happenslol/WarpDeplete/releases)

- fix: Fix count display and use MDT total count when available (#76)  
    Use percentages returned from GetScenarioInfo for count calculation  
    Fetch total count from MDT  
    Use MDT total count to calculate current count  
    Fixed the ObjectiveTrackerFrame not staying hidden, again  
    Add logging for SetForcesPercent  
    Ceil and log estimated count  
    Fix current count for MDT total count  
    Use floor again for count calculations  
    Fix another forcesState typo  
- Fixed the ObjectiveTrackerFrame not staying hidden (#75)  
