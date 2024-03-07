XPRACTICE.SMOLDERON.RING_RADIUS={}	-- don't touch this line

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- User-editable values.
-- Note that all players will automatically use the RING_RADIUS and PLAYER_HITBOX_RADIUS of the officer who clicks the start button.
-- Players will still need to share changes to this file if they intend to play without the group leader.
-- EXPLOSION_ANIMATION_DELAY, RING_FLASH and ADJUST_CENTRAL_CIRCLE_FLASH are player-specific and do not affect multiplayer.
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

-- Hitboxes were estimated by comparing two adjacent ring telegraphs against a dark background.
-- The dark outline between each ring moves back and forth a bit over time.
XPRACTICE.SMOLDERON.RING_RADIUS[1]={0,12.3}
XPRACTICE.SMOLDERON.RING_RADIUS[2]={12.3,23.25}
XPRACTICE.SMOLDERON.RING_RADIUS[3]={23.25,34.1}
XPRACTICE.SMOLDERON.RING_RADIUS[4]={34.1,45.25}
XPRACTICE.SMOLDERON.RING_RADIUS[5]={45.25,999}

-- This might actually be 0 as far as the server is concerned, but we err on the side of difficulty.
XPRACTICE.SMOLDERON.PLAYER_HITBOX_RADIUS=0.4

-- Delay between telegraph disappearing and explosion effects. Cosmetic only; does not affect dance timing.
XPRACTICE.SMOLDERON.EXPLOSION_ANIMATION_DELAY=0.1

-- Flash exists in the game files but wasn't visible during PTR testing.  Set this to true to display them.
-- The flashes are not perfectly aligned with the telegraphs -- might be a leftover from earlier development.
XPRACTICE.SMOLDERON.RING_FLASH=false

-- Central circle flash is very much larger than the telegraph; set this to true to shrink it a bit.
XPRACTICE.SMOLDERON.ADJUST_CENTRAL_CIRCLE_FLASH=true


-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
--
-- tommy_lee_jones_looks_up_from_newspaper.gif
--
-- (Officer does NOT automatically send these to other players. Possibility of desync if values do not match other players.)
--
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

XPRACTICE.SMOLDERON.KNOCKBACK_HZ_VELOCITY = 27.5*1.1	-- was originally 27.5, adding 10% by popular demand
XPRACTICE.SMOLDERON.KNOCKBACK_VT_VELOCITY = 7.0			-- for reference, player gravity is -25.0
XPRACTICE.SMOLDERON.MOTE_SPAWN_DELAY = 0.58				-- if you change VERTICAL velocity, adjust the delay so the orbs appear when you touch the ground