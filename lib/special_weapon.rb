class SpecialWeapon < Weapon
  def initialize
    super("Special Weapon" , 30,25)
  end
  def hit(robot)
    robot.scan.each do |robot|
    shield_amount = robot.shield
    robot.wound(robot.shield + 30)
    robot.shield = shield_amount
    end  
  end
end