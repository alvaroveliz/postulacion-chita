require 'invoice'
require 'date'

RSpec.describe Invoice do
  let(:invoice) { Invoice.new('76329692-K', '77360390-1', 1000000, 75, '2024-09-21') }

  describe '#initialize' do
    it 'sets the correct attributes' do
      expect(invoice.emitter_rut).to eq('76329692-K')
      expect(invoice.debtor_rut).to eq('77360390-1')
      expect(invoice.amount).to eq(1000000)
      expect(invoice.folio).to eq(75)
      expect(invoice.due_date).to eq(Date.parse('2024-09-21'))
    end
  end

  describe '#days_until_due' do
    it 'calculates the correct number of days until due' do
      allow(Date).to receive(:today).and_return(Date.parse('2024-08-22'))
      expect(invoice.days_until_due).to eq(31)
    end
  end
end
