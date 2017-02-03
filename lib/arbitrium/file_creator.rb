module Arbitrium
  class FileCreator
    attr_reader :file_with_path, :method_name, :pwd, :module_array

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @file_with_path = options[:file]
      @method_name    = options[:method_name]
      @pwd            = options[:pwd]
      @module_array   = options[:module_array]
    end

    def perform
      puts create_file ? "Successfully created file in #{full_path_with_file}" : "Failed to create file!"
    end

    private

    def create_file
      File.open(full_path_with_file, 'w') do |file|
        file.write(<<~EOF
          require 'arbitrium'

          #{file_header}
          #{add_spaces}  def self.#{method_name}()
          #{add_spaces}    new().#{method_name}
          #{add_spaces}  end

          #{add_spaces}  def initialize()
          #{add_spaces}    # insert instance variables here
          #{add_spaces}  end

          #{add_spaces}  def #{method_name}
          #{add_spaces}    # define tasks needed to complete here
          #{add_spaces}    # next, define result of tasks
          #{add_spaces}    Arbitrium::Result.new()
          #{add_spaces}  end

          #{add_spaces}  private
          #{add_spaces}  # define methods from #{method_name} here
          #{file_footer}
          end
        EOF
        )
      end
    end

    def full_path_with_file
      pwd + modified_file_with_path
    end

    def modified_file_with_path
      return if file_with_path[0] == '/'

      '/' + file_with_path
    end

    def file_header
      "#{module_header}#{class_header}"
    end

    def module_header
      module_array.map.with_index { |module_name, i| "#{add_spaces(i)}module #{module_name}" }.join("\n")
    end

    def class_header
      module_array.empty? ? "class #{class_name}" : "\n#{add_spaces(module_array.length)}  class #{class_name}"
    end

    def add_spaces(value = modified_module_length)
      '  ' * value
    end

    def modified_module_length
      module_array.empty? ? 0 : module_array.length + 1
    end

    def class_name
      class_portion_of_path.split('_').map(&:capitalize).join('')
    end

    def class_portion_of_path
      file_with_path[0...file_with_path.length-3].match(/([^\/]+)$/)[0]
    end

    def file_footer
      module_array.map.with_index { |_, i| "#{add_spaces((module_array.length - i))}end" }.join("\n")
    end
  end
end
