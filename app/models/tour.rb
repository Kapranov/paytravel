class Tour < ActiveRecord::Base
  before_save :update_commission
  before_save :update_totalAmount

  validates_presence_of :firstName, :lastName, :email, :telephone
  validates :sum, presence: true,
    numericality: { only_integer: false, greater_than: 0 },
    format: { :with => /\A\d{1,6}(\.\d{0,2})?\z/ }
  validates :commission, presence: true,
    numericality: { only_integer: false, greater_than: 0 },
    format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }
  validates :totalAmount, presence: true,
    numericality: { only_integer: false, greater_than: 0 },
    format: { :with => /\A\d{1,6}(\.\d{0,2})?\z/ }
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates :percent, :inclusion => { :in => [true, false] }
  validates :percent, :presence => { :if => 'percent.nil?' }

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
    'T-' + id.to_s.rjust(6, '0')
  end

  def fullName
    lastName + " " + firstName
  end

  private
    def update_commission
      self[:commission] = commission
    end

    def update_totalAmount
      self[:totalAmount] = totalAmount
    end
end
