# Since grenades have a range of 2, if the robot has one equipped,
# it can attack an enemy robot that is 2 tiles away instead of just 1 tile away
# That said, it will also discard/unequip the grenade
require_relative 'spec_helper'

describe Robot do
  before :each do
    @battery = Battery.new
    @robot = Robot.new
  end

  it "should be an item" do
    expect(@battery).to be_an(Item)
  end

  it "has name 'Battery'" do
    expect(@battery.name).to eq("Battery")
  end

  it "has 25 weight" do
    expect(@battery.weight).to eq(25)
  end

  describe "#recharge" do
    it "fully recharges robots shield" do
      expect(@robot).to receive(:shield=).with(50) # :shield= is a setter method
      @battery.recharge(@robot)
    end
  end

  describe "#pick_up" do
    it "should auto recharge shield upon pickup" do
      allow(@robot).to receive(:shield).and_return(40)
      expect(@battery).to receive(:recharge).and_call_original
      @robot.pick_up(@battery)
    end  
     it "should not recharge if shield at 50" do
      allow(@robot).to receive(:shield).and_return(50)
      expect(@battery).not_to receive(:recharge)
      @robot.pick_up(@battery)
    end
  end
end

