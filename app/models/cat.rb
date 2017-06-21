# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  img_url     :string
#

require 'date'

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: ["M", "F"], message: "Not a valid gender!"}
  validates :color, inclusion: { in: %w(black white orange grey tuxedo calico brown), message: "No cats in that color." }

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    dependent: :destroy,
    class_name: :CatRentalRequest

  def age
    (Time.now.to_date - self.birth_date).to_i / 365
  end

end
