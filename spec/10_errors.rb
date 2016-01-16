require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    
  end

  # Recall that since it is using a "#" in the description,
  # we are describing/expecting a pick_up instance method
  describe "#attack!" do
    it "should raise UnattackableEnemy error when attacking invalid target" do
      expect{@robot.attack!(nil)}.to raise_error(UnattackableEnemy)
    end
  end

  describe "#heal!" do
    it "should raise RobotAlreadyDeadError when healing dead robot" do
      @robot.wound(150)
      expect{@robot.heal!(100)}.to raise_error(RobotAlreadyDeadError)
    end
  end
end
