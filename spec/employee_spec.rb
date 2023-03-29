require "./lib/employee"

RSpec.describe Employee do
  before(:each) do 
    @weekly_availability = {
      monday: :non_pto,
      tuesday: :non_pto,
      wednesday: :pto,
      thursday: :pto, 
      friday: :non_pto
    }
    @employee = Employee.new(:certified, @weekly_availability)
  end

  describe '#initialize' do
    it 'returns employee type' do
      expect(@employee.type).to eq(:certified)
    end

    it 'returns employee weekly availability' do
      expect(@employee.weekly_availability).to eq(@weekly_availability)
    end
  end

  describe '#available?' do
    it 'returns employee availability per day' do
      expect(@employee.available?('tuesday')).to eq(true)
      expect(@employee.available?('wednesday')).to eq(false)
    end
  end
end