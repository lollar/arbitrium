module Arbitrium
  class Result < Struct.new(:success, :message, :result_object)
    def self.default_success(object = nil)
      new(true, 'Completed successfully.', object)
    end

    def initialize(*)
      super
      self.result_object ||= nil
    end

    def success?
      self.success
    end

    def failure?
      !success?
    end

    def object
      self.result_object
    end
  end
end
