require "rspec/expectations"

class Thing
  def widgets
    @widgets ||= []
  end
end

describe Thing do
  before(:all) do
    puts "once"
    @thing = Thing.new
  end

  describe "initialized in before(:all)" do
    it "has 0 widgets" do
      @thing.should have(0).widgets
    end

    it "can get accept new widgets" do
      @thing.widgets << Object.new
    end

    it "shares state across examples" do
      @thing.should have(1).widgets
    end
  end
end
