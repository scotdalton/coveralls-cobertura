module Coveralls
  module Cobertura
    class Reader
      describe ClassCoverage do
        let(:filename) { 'src/test/resources/TestSourceFile.scala' }
        let(:coverage) { [nil, nil, nil, 1, 1, 2, nil, nil, 1, 1] }
        subject(:class_coverage) { ClassCoverage.new(filename, coverage) }

        it { is_expected.to be_a ClassCoverage }

        describe '#filename' do
          subject { class_coverage.filename }
          it { is_expected.to eq filename }
        end

        describe '#coverage' do
          subject { class_coverage.coverage }
          it { is_expected.to eq coverage }
        end

        describe '#coverage' do
          subject { class_coverage.coverage }
          it { is_expected.to eq [nil, nil, nil, 1, 1, 2, nil, nil, 1, 1] }
        end
      end
    end
  end
end
