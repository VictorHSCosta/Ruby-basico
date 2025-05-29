module MathBasic
  def self.meters_to_cm(meters)
    meters * 100
  end

  def self.meters_to_km(metes)
    meters/100
  end

  def self.meters_to_mm(meters)
    meters = meters_to_cm(meters)
    meters*10
  end  
end

module Triangle
  def self.area(base , hight)
    (base * hight)/2
  end
end

module Square
  def self.area(side)
    side*side
  end
end