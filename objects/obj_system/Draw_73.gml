/// @description Displays FPS and turn state

if keyboard_check(vk_f1)
{
	draw_text(0, 0, "FPS = " + string(fps));
	draw_text(0, 16, "turn : " + string(global.state));
}