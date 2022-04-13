/// @description

var type = ds_map_find_value(async_load, "type"); 
if (type == network_type_non_blocking_connect) {
	connected = true
}
else if (type == network_type_data) {
	var t_buffer = ds_map_find_value(async_load, "buffer"); 
	var cmd_type = buffer_read(t_buffer, buffer_u8);

	switch(cmd_type) {
		case NET_GET_REQUESTED_NUM:
			var s = buffer_read(t_buffer, buffer_u16);
			num = string(s)
			show_debug_message("this is the number I got: " + num)
			break;
		case NET_GET_KICKED:
			var reason = buffer_read(t_buffer, buffer_string)
			show_message_async("You Have been kicked from the server.\nReason: " + reason)
			network_destroy(client)
			break;
		case NET_GET_MSG:
			msg = buffer_read(t_buffer, buffer_string)
			break;
	}
}
