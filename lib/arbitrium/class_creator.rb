module Arbitrium
  class ClassCreator
    attr_reader :file_with_path, :method_name

    def self.perform(file_with_path, method_name = nil)
      new(file_with_path, method_name).perform
    end

    def initialize(file_with_path, method_name)
      @file_with_path = file_with_path
      @method_name    = method_name
    end

    def perform
      puts file_with_path
      puts method_name.nil?
      puts method_name
    end
    private
  end
end
