/// @description Insert description here

// Inherit the parent event
event_inherited();

base_MP = 3; // Movement Points
MP = base_MP;

base_AP = 5; // Action Points
AP = base_AP;

mov_speed = ((global.sprite_size * base_MP) /  (60 * global.enemy_turn_speed)) * 1.5; // speed at which the player moves

move_through = base_MP * 31;