# Gamemaker Studio 2.0 Client for communication with Go Server
This is a simple TCP client that can handle buffers from a Golang Server. For the Go Server example, visit here: https://github.com/LDinos/go_gms_server

# Communication Example
## From Client to Server
**Gamemaker:** 
```
buffer_seek(c_buffer, buffer_seek_start, 0)
buffer_write(c_buffer, buffer_u8, NET_SEND_TESTMSG) //buffer message
buffer_write(c_buffer, buffer_string, "TEST123") //a string
buffer_write(c_buffer, buffer_u8, 20) //a number
network_send_raw(client, c_buffer, buffer_tell(c_buffer)) //Ignore the warning
```

Gamemaker client just sent this buffer to the server with a buffer message, a string and a number. Let's see how our server handles that:

**Go:**
```
...
index := 1
	switch buf[0] {
	case NET_GET_TESTMSG:
		fmt.Println("I got this message:", buffer_get_string(buf, &index, reqLen))
		fmt.Println("I got this number:", buffer_get_number(buf, &index))
	...
```
Go server understands and reads both the string and the number and shows it on console.

## From Server to Client
**Go:**
```
binary.Write(conn, binary.LittleEndian, NET_SEND_REQUESTED_NUM)
binary.Write(conn, binary.LittleEndian, uint16(19238)) //number that the server will send
```
Go server sends a number to one client (conn).

**Gamemaker:**
```
...
switch(cmd_type) {
		case NET_GET_REQUESTED_NUM:
			var s = buffer_read(t_buffer, buffer_u16);
			num = string(s)
			show_debug_message("this is the number I got: " + num)
			break;
```
Gamemaker succesfully gets the number and shows it.

## From Server to multiple Clients
If you want to send a buffer to all connected clients of the server, you can write something like this:
```
for client := range clients { //send to all connected clients
			binary.Write(client, binary.LittleEndian, NET_BROADCAST_MSG)
			binary.Write(client, binary.LittleEndian, []byte(msg)) //convert string to byte
		}
```