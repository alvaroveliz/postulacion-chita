class FinanceCalculator
  def initialize(api_client = ApiClient.new)
    @api_client = api_client
  end

  def process_invoice(invoice)
    quote = @api_client.fetch_quote(invoice)

    finance_cost = calculate_finance_cost(invoice.amount, quote['advance_percent'], quote['document_rate'], invoice.days_until_due)
    cash_to_receive = calculate_cash_to_receive(invoice.amount, quote['advance_percent'], finance_cost, quote['commission'])
    surplus = calculate_surplus(invoice.amount, quote['advance_percent'])

    format_results(finance_cost, cash_to_receive, surplus)
  end

  private

  def calculate_finance_cost(amount, advance_percent, document_rate, days)
    advance_amount = amount * (advance_percent / 100)
    daily_rate = (document_rate / 100) / 30
    advance_amount * daily_rate * days
  end

  def calculate_cash_to_receive(amount, advance_percent, finance_cost, commission)
    advance_amount = amount * (advance_percent / 100)
    advance_amount - (finance_cost + commission)
  end

  def calculate_surplus(amount, advance_percent)
    amount - (amount * (advance_percent / 100))
  end

  def format_results(finance_cost, cash_to_receive, surplus)
    {
      finance_cost: amount_format(finance_cost),
      cash_to_receive: amount_format(cash_to_receive),
      surplus: amount_format(surplus)
    }
  end

  def amount_format(amount)
    amount = amount.floor().to_s
    init_amount = ""
    while amount.length > 3
      init_amount = ".#{amount[(amount.size - 3)..amount.size]}#{init_amount}"
      amount = amount[0..-4]
    end
    "$#{amount}#{init_amount}"
  end
end