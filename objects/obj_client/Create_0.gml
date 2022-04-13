/// @description
/*Make sure macro values are the same for both client and server*/
#macro NET_SEND_TESTMSG 0
#macro NET_SEND_REQUESTNUM 1
#macro NET_SEND_MSG_ALL 4

#macro NET_GET_REQUESTED_NUM 2
#macro NET_GET_KICKED 3
#macro NET_GET_MSG 5
connected = false
client = network_create_socket(network_socket_tcp)
network_connect_raw_async(client, "127.0.0.1", 8080)
msg = ""
num = ""
c_buffer = buffer_create(1, buffer_grow, 1)