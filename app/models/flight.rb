class Flight < ActiveRecord::Base
  before_save :update_commission

  validates :firstName, :lastName, :email, :telephone, presence: true
  validates :sum, presence: true,
    numericality: { only_integer: false, greater_than: 0 },
    format: { :with => /\A\d{1,6}(\.\d{0,2})?\z/ }
  validates :commission, presence: true,
    numericality: { only_integer: false, greater_than: 0 },
    format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }
  validates :totalAmount, presence: true,
    numericality: { only_integer: false, greater_than: 0 },
    format: { :with => /\A\d{1,6}(\.\d{0,2})?\z/ }

  validates :percent, :inclusion => { :in => [true, false] }
  validates :percent, :presence => { :if => 'percent.nil?' }


  before_create do
    # self.firstName = contract.capitalize if firstName.blank?
  end

  def commission
    if self.percent == true
      (self.sum / 100 * 1.5).round(2)
    else
      (self.sum / 100 * 2.0).round(2)
    end
  end

  def totalAmount
    (self.sum + self.commission).round(0)
  end

  def name_telephone
    self.telephone.to_s.rjust(10, '0')
  end

  def name
    'A-' + id.to_s.rjust(6, '0')
  end

  private
    def total
      (unit_price * quantity).round(2)
    end

    # (1).percent_of(10)
    def percent_of(n)
      self.to_f / n.to_f * 100.0
    end

    def update_commission
      self[:commission] = commission
    end

    def update_totalAmount
      self[:totalAmount] = totalAmount
    end
end
