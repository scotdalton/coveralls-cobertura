module Coveralls
  module Cobertura
    class Reader
      class ClassCoverage
        attr_reader :filename, :coverage

        def initialize(filename, coverage)
          @filename = filename
          @coverage = coverage
        end
      end
    end
  end
end
