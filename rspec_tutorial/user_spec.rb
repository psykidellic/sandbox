require 'user'

describe User do
  it "should be in any roles assigned to it" do
    user = User.new
    user.should be_in_role("assigned role")
  end

  it "should NOT be in any roles NOT assigned to it" do
    user = User.new
    user.should_not be_in_role("unassigned role")
  end
end
