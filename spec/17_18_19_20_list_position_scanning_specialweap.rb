require_relative 'spec_helper'

describe Robot do
  before :each do
    Robot.clear
    @robot_main = Robot.new
    @robot_top = Robot.new
    @robot_bottom = Robot.new
    @robot_left = Robot.new
    @robot_right = Robot.new
    @robot_top.move_up
    @robot_bottom.move_down
    @robot_left.move_left
    @robot_right.move_right
    @weap = SpecialWeapon.new
  end

  it "should have 5 robots in list" do
    expect(Robot.robot_list.size).to eq(5)
  end

  it "main Robot should scan and show 4 around it" do

    expect(@robot_main.scan.size).to eq(4)
  end

  describe "in_position(x,y)#" do
    it "should show a single robot in surroundings and start point" do
      expect(Robot.in_position(0,0).size).to eq(1)
      expect(Robot.in_position(1,0).size).to eq(1)
      expect(Robot.in_position(0,1).size).to eq(1)
      expect(Robot.in_position(-1,0).size).to eq(1)
      expect(Robot.in_position(0,-1).size).to eq(1)
    end
  end

  #test below is a multicheck for range attack, disposal after use, shield bypass with 30 health damage
  describe "SpecialWeapon #hit" do
    it "should damage all surrounding bots even if aiming one bypassing their shields and dispose off the weapon" do
      @robot_main.pick_up(@weap)
      @robot_main.attack(@robot_top) #does not matter which robot the holder robot attacks
      expect(@robot_top.health).to eq(70)
      expect(@robot_bottom.health).to eq(70)
      expect(@robot_left.health).to eq(70)
      expect(@robot_right.health).to eq(70)
    end
  end
 
end

