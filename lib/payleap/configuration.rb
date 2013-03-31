module Payleap
  module Configuration
    VALID_OPTIONS_KEYS = [
      :username,
      :transaction_key
    ].freeze

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    def reset
      VALID_OPTIONS_KEYS.each{|k| send("#{k}=", nil)}
      self.username = nil
      self.transaction_key = nil
      self
    end
  end

end
