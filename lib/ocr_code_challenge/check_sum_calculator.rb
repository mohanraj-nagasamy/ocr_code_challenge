class CheckSumCalculator
  def initialize(input)
    @input = input
    @checksum = nil
  end

  def checksum
    raise "Invalid input: #{@input} contains non numeric" unless self.class.numeric?(@input)
    return @checksum if @checksum

    arr = @input.split("")
    mapped = arr.reverse.each_with_index.map {|int, index| (int.to_i * (index + 1))}
    sum = mapped.inject(&:+)
    @checksum = sum % 11
  end

  def valid?
    checksum == 0
  end

  def to_s
    return "Valid checksum: #{checksum}" if valid? 
    "Invalid checksum: #{checksum}" unless valid? 
  end

  # ClassMethods
  def self.numeric?(input)
    !input.to_s.match(/[^0-9]/)
  end  

end
