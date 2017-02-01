require "spec_helper"

RSpec.describe Arbitrium::Result do

  let(:result) { described_class }

  context 'initialization' do
    it { expect(result.new(false, 'Result Message')).to_not be nil }
  end
end
