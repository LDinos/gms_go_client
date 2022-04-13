///@description Say hi to server that will broadcast to every client
buffer_seek(c_buffer, buffer_seek_start, 0)
buffer_write(c_buffer, buffer_u8, NET_SEND_MSG_ALL)
buffer_write(c_buffer, buffer_string, "Hello!")
network_send_raw(client, c_buffer, buffer_tell(c_buffer)) //Ignore the warning