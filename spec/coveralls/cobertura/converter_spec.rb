require 'spec_helper'
module Coveralls
  module Cobertura
    describe Converter do
      let(:filename) { "#{File.dirname(__FILE__)}/../../support/cobertura.xml"}
      subject(:converter) { Converter.new(filename) }
      it { is_expected.to be_a Converter }

      describe '#filename' do
        subject { converter.filename }
        it { is_expected.to eq filename }
      end

      describe '#convert' do
        subject { converter.convert }
        it { is_expected.to be_an Array }
        it 'should have the correct information' do 
          expected(subject.last).to eq [
            'name' => 'src/test/resources/TestSourceFile2.scala',
            'source' => '',
            'coverage' => [1, 1, 1]
          ]
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
