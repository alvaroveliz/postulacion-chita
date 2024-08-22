require 'net/http'
require 'json'
require 'dotenv/load'

class ApiClient
  API_KEY = ENV["API_KEY"]
  BASE_URL = 'https://chita.cl/api/v1/pricing/simple_quote'

  def fetch_quote(invoice)
    uri = URI("#{BASE_URL}?client_dni=#{invoice.emitter_rut}&debtor_dni=#{invoice.debtor_rut}&document_amount=#{invoice.amount}&folio=#{invoice.folio}&expiration_date=#{invoice.due_date}")

    request = Net::HTTP::Get.new(uri)
    request['X-Api-Key'] = API_KEY

    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
    
    JSON.parse(response.body)
  end
end