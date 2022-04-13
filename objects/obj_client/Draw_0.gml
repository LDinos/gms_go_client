/// @description
if (connected) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(room_width/2, 24, "Left Arrow: send a buffer with a text and a number")
	draw_text(room_width/2, 48, "Right Arrow: Request a number from the server")
	draw_text(room_width/2, 64, "Number I got: " + num)
	draw_text(room_width/2, 80, "Up Arrow: Broadcast msg to all clients")
	draw_text(room_width/2, 100, "Message: " + msg)
} else draw_text(room_width/2, room_height/2, "Server not found")
