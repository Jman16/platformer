/// @description Insert description here
// You can write your code in this editor

//Get inputs (1 = pressed, 0 = not pressed)
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);

//Work out where to move horizontally
hsp = (key_right - key_left) * hsp_walk;

//Work out where to move vertically
vsp = vsp + grv;

//Work out if we should jump
if (place_meeting(x,y+1,oWall)) and (key_jump)
{
    vsp = vsp_jump; 
}

//Check for horizontal collisions and then move if we can
var onepixel = sign(hsp) //moving left or right? right = 1, left = -1.
if (place_meeting(x+hsp,y,oWall))
{
    //move as close as we can
    while (!place_meeting(x+onepixel,y,oWall))
    {
        x = x + onepixel;
    }
    hsp = 0;
}
x = x + hsp;

//Check for vertical collisions and then move if we can
var onepixel = sign(vsp) //up = -1, down = 1.
if (place_meeting(x,y+vsp,oWall))
{
    //move as close as we can
    while (!place_meeting(x,y+onepixel,oWall))
    {
        y = y + onepixel;
    }
    vsp = 0;
}
y = y + vsp;