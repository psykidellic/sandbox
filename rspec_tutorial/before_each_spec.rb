require "rspec/expectations"

class Thing
  def widgets
    @widgets ||= []
  end
end

describe Thing do
  describe "initialized in before(:each)" do
    before(:each) do
      puts "Before each called"
      @thing = Thing.new
    end

    it "has 0 widgets" do
      @thing.should have(0).widgets
    end

    it "can get accept new widgets" do
      @thing.widgets << Object.new
    end

    it "does not share state across examples" do
      @thing.should have(0).widgets
    end
  end

  describe "initialized in before(:each)" do
    it "has 0 widgets" do
      @thing.should have(0).widgets
    end

    it "can get accept new widgets" do
      @thing.widgets << Object.new
    end

    it "does not share state across examples" do
      @thing.should have(0).widgets
    end
  end
end
