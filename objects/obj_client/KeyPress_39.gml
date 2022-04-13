///@description Request a specific number from server
buffer_seek(c_buffer, buffer_seek_start, 0)
buffer_write(c_buffer, buffer_u8, NET_SEND_REQUESTNUM)
network_send_raw(client, c_buffer, buffer_tell(c_buffer)) //Ignore the warning