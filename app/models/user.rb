class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    '#{name}'
  end

  Time::DATE_FORMATS[:due_date] = "%d-%m-%Y / %H:%m:%S"

end
