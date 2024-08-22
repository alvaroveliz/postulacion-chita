require 'date'

class Invoice
  attr_reader :emitter_rut, :debtor_rut, :amount, :folio, :due_date

  def initialize(emitter_rut, debtor_rut, amount, folio, due_date)
    @emitter_rut = emitter_rut
    @debtor_rut = debtor_rut
    @amount = amount
    @folio = folio
    @due_date = Date.parse(due_date)
  end

  def days_until_due
    (due_date - Date.today).to_i + 1
  end
end