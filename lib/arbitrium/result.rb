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
    end

    def success?
      self.success
    end

    def failure?
      !success?
    end
  end
end
