"""
Code from https://pymotw.com/2/socket/tcp.html#choosing-an-address-for-listening
"""
import socket
import sys

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the address given on the command line
server_name = sys.argv[1]
server_address = (server_name, 10000)
sock.bind(server_address)
print('starting up on %s port %s' % sock.getsockname())
sock.listen(1)

while True:
    print('waiting for a connection')
    connection, client_address = sock.accept()
    try:
        print('client connected: ' + str(client_address))
        while True:
            data = connection.recv(16)
            print('received "%s"' % data)
            if data:
                connection.sendall(data)
            else:
                break
    finally:
        connection.close()
