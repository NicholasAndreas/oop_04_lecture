require 'csv'
require_relative 'patient'

class PatientRepository

  # STATE ?
  # - @patients (Array of Patient instances)

  def initialize(csv_file, room_repository)
    @patients = []
    @next_id = 1
    @csv_file = csv_file
    @room_repository = room_repository
    load_csv
  end

  # Behavior
  # - add

  def add(patient)
    @patients << patient
    patient.id = @next_id
    @next_id += 1
  end

  private
  def load_csv
    @next_id = 0
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Fixnum
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      patient = Patient.new(row)
      patient.id = row[:id]
      # get my room_id
      # find the room with this id
      # add the patient instance to the room
      room_id = row[:room_id].to_i
      room = room_repository.find(room_id)
      room.add_patient(patient)
      @next_id = row[:id]
      @patients << patient
    end
    @next_id += 1
  end
end


repo = PatientRepository.new('patients.csv')
p repo




