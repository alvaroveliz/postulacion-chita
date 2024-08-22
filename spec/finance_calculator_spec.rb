require 'finance_calculator'
require 'invoice'

RSpec.describe FinanceCalculator do
  let(:api_client) { instance_double(ApiClient) }
  let(:calculator) { FinanceCalculator.new(api_client) }
  let(:invoice) { Invoice.new('76329692-K', '77360390-1', 1000000, 75, '2024-09-21') }
  let(:quote) { { 'document_rate' => 1.09, 'commission' => 0, 'advance_percent' => 99.0 } }

  before do
    allow(api_client).to receive(:fetch_quote).and_return(quote)
    allow(invoice).to receive(:days_until_due).and_return(31)
  end

  describe '#process_invoice' do
    it 'calculates finance cost, cash to receive, and surplus' do
      result = calculator.process_invoice(invoice)

      expect(result[:finance_cost]).to eq(11150)
      expect(result[:cash_to_receive]).to eq(978849)
      expect(result[:surplus]).to eq(10000)
    end
  end
end
