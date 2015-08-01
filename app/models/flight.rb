class Flight < ActiveRecord::Base
  before_save :update_commission
  before_save :update_totalAmount

  monetize :sum, :commission, :totalAmount
  phony_normalize :telephone, :default_country_code => 'UK'

  validates_presence_of :firstName, :lastName, :email, :telephone

  validates :firstName, format: { with: /\A[А-Яа-яІіЇїЄєҐґ]+\z/,
    minimum: 4, maximum: 15, message: "only allows letters" }

  validates :lastName, format: { with: /\A[А-Яа-яІіЇїЄєҐґ]+\z/,
    minimum: 4, maximum: 15, message: "only allows letters" }

  validates :sum, numericality: {only_integer: true, greater_than: 0 }

  # validates_format_of :email, with: /\A(\S+)@(\S+)\.(\S+)\z/i
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  validates :percent, :inclusion => { :in => [true, false] }
  validates :percent, :presence => { :if => 'percent.nil?' }

  validates :telephone, length: { is: 9 }, numericality: { only_integer: true }
  validates_format_of :telephone, with: /\A[+-]?\d+\Z/

  def commission
    if percent == true
      ((sum / 100) * 1.5).round(2)
    elsif percent == false
      ((sum / 100) * 2).round(2)
    end
  end

  def totalAmount
    if self.sum
      (sum + commission).round(0)
    end
  end

  def name_telephone
    self.telephone.to_s.rjust(10, '0')
  end

  def name
    'A-' + id.to_s.rjust(6, '0')
  end

  def fullName
    lastName + " " + firstName
  end

  def self.search search
    where("id || email || telephone LIKE ?", "%#{search}%")
  end

  # def total
  #  (unit_price * quantity).round(2)
  # end

  # (1).percent_of(10)
  # def percent_of(n)
  #  self.to_f / n.to_f * 100.0
  # end

  # before_create do
  #   self.firstName = contract.capitalize if firstName.blank?
  # end

  private
    def update_commission
      self[:commission] = commission
    end

    def update_totalAmount
      self[:totalAmount] = totalAmount
    end
end
