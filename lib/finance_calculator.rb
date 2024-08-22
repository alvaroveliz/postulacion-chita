class FinanceCalculator
  def initialize(api_client = ApiClient.new)
    @api_client = api_client
  end

  def process_invoice(invoice)
    quote = @api_client.fetch_quote(invoice)

    # Variables to use
    amount = invoice.amount
    advance_percent = quote['advance_percent']
    document_rate = quote['document_rate']
    commission = quote['commission']
    days = invoice.days_until_due


    # Finance cost
    advance_amount = amount * (advance_percent / 100)
    daily_rate = (document_rate / 100) / 30
    finance_cost = advance_amount * daily_rate * days

    # Cash to receive
    advance_amount = amount * (advance_percent / 100)
    cash_to_receive = advance_amount - (finance_cost + commission)

    # Surplus
    surplus = amount - (amount * (advance_percent / 100))

    # Result as json
    {
      finance_cost: amount_format(finance_cost),
      cash_to_receive: amount_format(cash_to_receive),
      surplus: amount_format(surplus)
    }
  end

  private 

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