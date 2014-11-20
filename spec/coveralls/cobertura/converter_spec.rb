require 'spec_helper'
module Coveralls
  module Cobertura
    describe Converter do
      let(:filename) { "#{File.dirname(__FILE__)}/../../support/cobertura.xml"}
      subject(:converter) { Converter.new(filename) }
      it { should be_a Converter }

      describe '#filename' do
        subject { converter.filename }
        it { should eq filename }
      end

      context "when the filename doesn't exist" do
        let(:filename) { "/does/not/exist" }
        it 'should raise an ArgumentError' do
          expect { subject }.to raise_error ArgumentError
        end
      end
    end
  end
end
