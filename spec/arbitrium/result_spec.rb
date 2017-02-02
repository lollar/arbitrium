require "spec_helper"

RSpec.describe Arbitrium::Result do

  let(:result) { described_class }

  it 'initializes successfully with required parameters' do
    expect(result.new(false, 'Result Message')).to be_valid
    expect(result.new(false, 'Result Message', Object)).to be_valid
  end

  it 'raises an error when incorrect data types are passed in' do
    expect{ result.new('Not Boolean', false) }.to raise_error
  end

  context '#default_success' do
    let(:result) { described_class.default_success }

    it { expect(result).to be_valid }
    it { expect(result).to be_successful }
    it { expect(result.message).to eq 'Completed successfully.' }
    it { expect(result.object).to be_a NilClass }
  end

  describe 'successful result' do
    let(:result) { described_class.new(true, 'Winning!', Object) }

    context 'methods' do
      it { expect(result).to be_valid }
      it { expect(result).to be_successful }
      it { expect(result).to_not be_failed }
    end

    context 'instance variables' do
      it { expect(result.success).to be_truthy }
      it { expect(result.message).to eq 'Winning!' }
      it { expect(result.object).to be_a Object }
    end
  end

  describe 'failed result' do
    let(:result) { described_class.new(false, 'Losing!', nil) }

    context 'methods' do
      it { expect(result).to be_valid }
      it { expect(result).to_not be_successful }
      it { expect(result).to be_failed }
    end

    context 'instance variables' do
      it { expect(result.success).to be_falsey }
      it { expect(result.message).to eq 'Losing!' }
      it { expect(result.object).to be_a NilClass }
    end
  end
end
