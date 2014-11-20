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
    end
  end
end
