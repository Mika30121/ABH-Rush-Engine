//tails fly

if (action == 1 && djmp && key_jumpr)
    djmp = false

if action == 1 && key_jump && !djmp
{
    action = 4
    alarm[3] = 480
    scrPlaySound(snd_Tails_fly,0.6,1,true)
}

if action == 4 || action == 4.5
{
    if key_l xdir = -1;
    if key_r xdir =  1;
    
    if key_r
        {
            if hsp >=0 
            {
                if hsp< currhsph 
                    hsp+=acc
            } 
            else hsp+=dcc;
        }
        if key_l
        {
            if hsp<=0 
            {
                if hsp > -currhsph 
                    hsp-=acc
            }         
            else 
                hsp-=dcc;
        }
        if !key_r && !key_l
        {
            if hsp > 0 
                hsp -= frc; 
            if hsp < 0 
                hsp += frc;
            if hsp <= frc && hsp >= -frc 
                hsp = 0;
        }
    
    if vsp < -4
        vsp = -4
    if vsp > 4
        vsp = 4
    if ground
    {
        action = 0
    }
}

if action == 4 && key_jump
{
    vsp -= 0.5
}

if action == 4
{
    var enemy;
    enemy = instance_place(x,y - 18,obj_enemy)
    if enemy != noone
    {
        with(enemy)
        {
            instance_destroy()
        }
    }
}

if ground && !djmp
    djmp = true
    
if !(action == 4 || action == 4.5)
    alarm[3] = 0
    
if audio_is_playing(snd_Tails_fly) && action != 4
    audio_stop_sound(snd_Tails_fly)
