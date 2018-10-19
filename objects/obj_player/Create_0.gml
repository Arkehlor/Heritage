/// @description Insert description here

// Inherit the parent event
event_inherited();

mov_speed = 3; // speed at which the player moves

base_MP = 3; // Movement Points
MP = base_MP;

base_AP = 6; // Action Points
AP = base_AP;

moving = false;

global.player_turn_speed = 9.0; // The lenght of a player turn
global.rush_time = 2 / 9; // The portion of the turn dedicated to rush
global.norm_time = 5 / 9; // Same for normal
global.prep_time = 2 / 9; // Same for preparation