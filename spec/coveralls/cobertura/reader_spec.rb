module Coveralls
  module Cobertura
    describe Reader do
      let(:filename) { "#{File.dirname(__FILE__)}/../../support/cobertura.xml"}
      subject(:reader) { Reader.new(filename) }

      it { is_expected.to be_a Reader }

      describe '#filename' do
        subject { reader.filename }
        it { is_expected.to eq filename }
      end

      describe '#number_of_classes' do
        subject { reader.number_of_classes }
        it { is_expected.to eq 3 }
      end

      describe '#class_coverages' do
        subject { reader.class_coverages }
        it { is_expected.to all( be_a Reader::ClassCoverage ) }
        it "should have 2 elements" do
          expect(subject.size).to eq 2
        end
        context 'for the class coverage for "src/test/resources/TestSourceFile.scala"' do
          let(:class_filename) { 'src/test/resources/TestSourceFile.scala' }
          it 'should have the correct coverage' do
            class_coverage = subject.find do |class_coverage|
              class_coverage.filename == class_filename
            end
            coverage = class_coverage.coverage
            expect(coverage).to eq [nil, nil, nil, 1, 1, 2, nil, nil, 1, 1]
          end
        end
        context 'for the class coverage for "src/test/resources/TestSourceFile2.scala"' do
          let(:class_filename) { 'src/test/resources/TestSourceFile2.scala' }
          it 'should have the correct coverage' do
            class_coverage = subject.find do |class_coverage|
              class_coverage.filename == class_filename
            end
            coverage = class_coverage.coverage
            expect(coverage).to eq [1, 1, 1]
          end
        end
      end

      context "when the filename doesn't exist" do
        let(:filename) { "/does/not/exist" }
        it 'should raise an ArgumentError' do
          expect { is_expected.to }.to raise_error ArgumentError
        end
      end
    end
  end
end
