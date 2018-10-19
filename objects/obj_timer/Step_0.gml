/// @description Reduce remaining time if player turn isin progress

if (timer < max_time)
{
	timer += delta_time / 1000000;
}
else
{
	timer = max_time;
}
