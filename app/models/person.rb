class Person < ActiveRecord::Base
validates :title && :last_name, presence: true || :first_name && :last_name, presence: true


  def full_name
    "#{title} #{first_name} #{last_name}"
  end



end
