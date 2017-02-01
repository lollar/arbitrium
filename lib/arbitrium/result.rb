module Arbitrium
  class Result
    attr_reader :success, :message, :object

    def self.default_success(object = nil)
      new(true, 'Completed successfully.', object)
    end

    def initialize(success, message, object = nil)
      @success = success
      @message = message
      @object  = object

      raise 'Error! Incorrect data types for arguments expected (boolean, string, object)!' unless valid?
    end

    def success?
      self.success
    end

    def failure?
      !success?
    end

    def valid?
      check_validity
    end

    private

    def check_validity
      check_success_class && check_message_class
    end

    def check_success_class
      success.is_a?(TrueClass) || success.is_a?(FalseClass)
    end

    def check_message_class
      message.is_a?(String)
    end
  end
end
