/// @description End of normal, start of prep

global.state = states.prep; // Sets current state as preparation 

with (obj_timer)
{
	timer = 0;
	max_time = max_time_prep;	
}

with (obj_player)
{
	AP++; // Increases player AP as it is the beginning of the preparation phase
}

alarm[3] = 60 * global.player_turn_speed * global.prep_time; // Prepares next part of turn