require 'socket'

module LogServer
  class Client
    def initialize(host='127.0.0.1', port=8081)
      @socket = TCPSocket.new(host, port)
    end

    def start
      loop do
        while line = @socket.gets
          puts line
        end
      end
    end
  end
end
