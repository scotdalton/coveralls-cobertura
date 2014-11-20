module Coveralls
  module Cobertura
    class Converter
      attr_reader :filename

      def initialize(filename)
        @filename = filename
      end
    end
  end
end
