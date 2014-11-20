module Coveralls
  module Cobertura
    class Converter
      attr_reader :filename

      def initialize(filename)
        @filename = filename
        @reader = Reader.new(filename)
      end

      def convert
        reader.class_coverages.map do |class_coverage|
          {
            'name' => class_coverage.filename,
            'source' => '',
            'coverage' => class_coverage.coverage
          }
        end
      end

      private
      attr_reader :reader
    end
  end
end
