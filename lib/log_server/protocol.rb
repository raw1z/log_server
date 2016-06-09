module LogServer
  class Connection
    def initialize(client)
      @client = client
      @client.puts "New Client registered"
    end

    def update(notification)
      @client.puts notification.to_json
    end
  end
end

