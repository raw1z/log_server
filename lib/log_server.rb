require 'log_server/version'
require 'log_server/formatter'
require 'log_server/notification'
require 'log_server/protocol'
require 'log_server/server'
require 'log_server/client'

module LogServer
  def self.formatter
    @formatter ||= Formatter.new
  end
end
