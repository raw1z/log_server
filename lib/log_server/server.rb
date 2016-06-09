require 'observer'
require 'ap'
require 'socket'

module LogServer
  class Server
    include Observable

    def initialize
      @server = TCPServer.new '127.0.0.1', 8081
    end

    def start
      Thread.new do
        client = @server.accept
        add_observer Connection.new(client)
      end
    end

    def update(notification)
      changed
      notify_observers(notification)
    end
  end
end
