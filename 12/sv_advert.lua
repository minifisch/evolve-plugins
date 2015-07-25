local PLUGIN = {}
PLUGIN.Title = "Advert"
PLUGIN.Description = "Places a advert every x mins/seconds in chat."
PLUGIN.Author = "TheCreeper"

//////////////////////////////////////////////////////////////////////////////////////////
// Edit "Advert Here" with your advert but only edit within the brackets.
// Edit the number 300 below for your advert to appear every x seconds ( 300 seconds is 5 mins).
// Copy and paste the line below as many times as you like.
// If you want to put a something on a new line in your advert this use /n 
// Example timer.Create("1ad", 300,0, function() evolve:Notify( evolve.colors.white, "Advert Here/n Advert Here/n Advert here/n" ) end)
// Output would be 
// Advert Here
// Advert Here
// Advert Here
//////////////////////////////////////////////////////////////////////////////////////////

timer.Create("1ad", 300,0, function() evolve:Notify( evolve.colors.white, "Advert Here" ) end)

// Do not place anything below this line.
//////////////////////////////////////////////////////////////////////////////////////////

evolve:RegisterPlugin( PLUGIN )