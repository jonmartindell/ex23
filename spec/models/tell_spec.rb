require "spec_helper"

describe Tell do
  it "can resolve" do
    expect(Tell.new("the response")).to respond_to(:resolve)
  end

  describe "initialize" do
    it "requires an answer to display" do
      expect{Tell.new}.to raise_error ArgumentError
    end
  end

  describe "resolve" do
    subject { Tell.new("42 is the answer") }
    it "shows the answer to the user" do
      expect{subject.resolve}.to output("42 is the answer\n").to_stdout
    end
  end
end
