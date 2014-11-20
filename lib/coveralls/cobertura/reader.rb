module Coveralls
  module Cobertura
    require 'multi_xml'
    class Reader
      XML_OPTIONS = {symbolize_keys: true}

      attr_reader :filename, :number_of_classes

      def initialize(filename)
        unless File.exists?(filename)
          raise ArgumentError.new("Expecting file named #{filename} to exist.")
        end
        @filename = filename
        @number_of_classes = classes.size
      end

      def class_coverages
        @class_coverages ||= filenames.map do |filename|
          class_coverage(filename)
        end
      end

      private
      def class_coverage(filename)
        ClassCoverage.new(filename, coverage_for_filename(filename))
      end

      def coverage_for_filename(filename)
        lines = classes.select do |e|
          e[:filename] == filename
        end.map do |e|
          e[:lines][:line]
        end.flatten
        max_line = lines.map{ |line| line[:number].to_i }.max
        (1..max_line).map do |index|
          found_line = lines.find { |line| line[:number] == index.to_s }
          (found_line.nil?) ? nil : found_line[:hits].to_i
        end
      end

      def filenames
        @filenames ||= classes.map { |e| e[:filename] }.uniq
      end

      def classes
        @classes ||= classes_root[:class] unless classes_root.nil?
      end

      def classes_root
        @classes_root ||= packages[:classes] unless packages.nil?
      end

      def packages
        @packages ||= packages_root[:package] unless packages_root.nil?
      end

      def packages_root
        @packages_root ||= coverage_root[:packages] unless coverage_root.nil?
      end

      def coverage_root
        @coverage_root ||= cobertura[:coverage] unless cobertura.nil?
      end

      def cobertura
        @cobertura ||= MultiXml.parse(file, XML_OPTIONS)
      end

      def file
        @file ||= File.new(filename)
      end
    end
  end
end
