class Patient
  # STATE?
  # cured (Boolean)
  # name (String)
  # room (Room)

  attr_accessor :room
  attr_accessor :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end


  # BEHAVIOR?
  # cured?
  # cured!

    def cured?
      @cured
    end

    def cured!
      @cured = true
    end
end
