require "spec_helper"

RSpec.describe Arbitrium do
  it "has a version number" do
    expect(Arbitrium::VERSION).not_to be nil
  end
end
