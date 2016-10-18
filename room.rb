require_relative 'patient'

class Room
  class CapacityReachedError < Exception; end

  # STATE ?
  # capacity (Fixnum)
  # patients (Array of Patient instances)
  attr_accessor :id

  def initialize(attributes = {})
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end


  # BEHAVIOR
  # add_patient
  # full?

  def add_patient(patient)
    if self.full?
      fail CapacityReachedError
    else
      @patients << patient
      patient.room = self
    end
  end

  def full?
    @patients.size == @capacity
  end
end
