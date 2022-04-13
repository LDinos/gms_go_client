///@description Send a test buffer to the server
buffer_seek(c_buffer, buffer_seek_start, 0)
buffer_write(c_buffer, buffer_u8, NET_SEND_TESTMSG)
buffer_write(c_buffer, buffer_string, "TEST123")
buffer_write(c_buffer, buffer_u8, 20)
network_send_raw(client, c_buffer, buffer_tell(c_buffer)) //Ignore the warning