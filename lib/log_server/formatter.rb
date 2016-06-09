require 'observer'
require 'active_support'

module LogServer
  class Formatter < ActiveSupport::Logger::SimpleFormatter
    include Observable

    def initialize
      server = LogServer::Server.new
      server.start
      add_observer server
    end

    def call(severity, timestamp, progname, message)
      changed
      notification = Notification.new(severity, timestamp, progname, message, caller)
      notify_observers(notification)
      super
    end
  end
end

