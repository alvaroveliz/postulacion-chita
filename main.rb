# Simple Quote Finance calculator

require_relative 'lib/invoice'
require_relative 'lib/api_client'
require_relative 'lib/finance_calculator'

# Uso del programa
invoice = Invoice.new('76329692-K', '77360390-1', 1000000, 75, '2024-09-21')
calculator = FinanceCalculator.new
result = calculator.process_invoice(invoice)

puts "Costo de financiamiento: #{result[:finance_cost]}"
puts "Giro a recibir: #{result[:cash_to_receive]}"
puts "Excedentes: #{result[:surplus]}"