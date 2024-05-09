# [5.13.0](https://github.com/WeakAuras/WeakAuras2/tree/5.13.0) (2024-05-07)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/5.12.9...5.13.0)

## Highlights

 - Updates for Retail and Cataclysm patches
- Add support for Atlas textures in AuraBars 

## Commits

Boneshock (5):

- add options for sound fadeout
- Fix instance type options are empty on cata classic
- Enable clickthrough with 'tooltip on mouseover'
- Rename cleu message prefix and suffix
- Add headers to categorize filters in large triggers (#5027)

InfusOnWoW (1):

- Update Atlas File List from wago.tools

Stanzilla (5):

- Update TOC for Retail Patch 10.2.7
- Few more spelling and type fixes
- Fix typo
- Update WeakAurasModelPaths from wago.tools
- Update bug_report.yml

emptyrivers (3):

- ensure we always compute the correct rect for a dynamic group (#5034)
- only upload & advertise build artifact if triggering actor has a write bit
- advertise a link to an experimental build, if one exists (#5037)

mrbuds (8):

- Cataclysm Templates
- Fix Premade Auras option not shown
- For spell input fields with noValidation (used for "Name(s)" fields) show name from GetSpellInfo when value is a number, fixes #5058
- Add missing global in luacheckrc
- AuraBar: add some alias textures, and option to use texture picker
- Weapon Enchant trigger: fetch data for ranged slot only on Cataclysm
- Weapon Enchant trigger: support ranged weapon on Cataclysm, fixes #5043
- Prepare for the removal of deprecated functions

