require 'drb/drb'

module LogServer
  class Notification < ::Hash
    include DRb::DRbUndumped

    def initialize(severity, timestamp, progname, message, stacktrace)
      self[:app] = Rails.application.class.parent_name
      self[:process_id] = Process.pid
      self[:level] = severity
      self[:time] = timestamp
      self[:progname] = progname
      self[:message] = message
      self[:stacktrace] = stacktrace
    end
  end
end
