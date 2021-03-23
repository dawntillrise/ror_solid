class DealProcessor
  def initialize(deals)
    @deals = deals
  end
  
  def process
    @deals.each do |deal|
      Commission.create(deal: deal, amout: calculate_commission)
      mark_deal_processed
    end
  end

  private

  def mark_deal_processed
    @deal.process = true
    @deal.save!
  end

  def calculate_comission
    @deal.dollar_amount * 0.05
  end
end

###  SRP  ###

class DealProcessor
  def initialize(deals)
    @deals = deals
  end

  def process
    @deals.each do |deal|
      mark_deal_processed
      CommissionCalculator.new.create_commission(deal)
    end
  end

  private

  def mark_deal_processed
    @deal.processed = true
    @deal.save!
  end
end

class CommissionCalculator
  def create_commission(deal)
    Commission.create(deal: deal, amount: deal.dollar_amount * 0.05)
  end
end
