require 'api_client'
require 'invoice'
require 'webmock/rspec'

RSpec.describe ApiClient do
  let(:api_client) { ApiClient.new }
  let(:invoice) { Invoice.new('76329692-K', '77360390-1', 1000000, 75, '2024-09-21') }
  let(:response_body) {
    {
      "document_rate": 1.09,
      "commission": 0,
      "advance_percent": 99.0
    }.to_json
  }

  before do
    stub_request(:get, "https://chita.cl/api/v1/pricing/simple_quote")
      .with(query: {
              client_dni: invoice.emitter_rut,
              debtor_dni: invoice.debtor_rut,
              document_amount: invoice.amount,
              folio: invoice.folio,
              expiration_date: invoice.due_date
            },
            headers: { 'X-Api-Key' => ENV['API_KEY'] })
      .to_return(status: 200, body: response_body, headers: {})
  end

  describe '#fetch_quote' do
    it 'fetches a quote from the API and parses the response' do
      quote = api_client.fetch_quote(invoice)
      expect(quote['document_rate']).to eq(1.09)
      expect(quote['commission']).to eq(0)
      expect(quote['advance_percent']).to eq(99.0)
    end
  end
end
