module Coveralls
  module Cobertura
    class Converter
      attr_reader :filename

      def initialize(filename)
        unless File.exists?(filename)
          raise ArgumentError.new("Expecting file named #{filename} to exist.")
        end
        @filename = filename
      end
    end
  end
end
