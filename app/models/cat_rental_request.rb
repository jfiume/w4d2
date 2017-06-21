# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, presence: true, inclusion: { in: ["APPROVED", "DENIED", "PENDING"], message: "Not a proper command"}
  validates :cat_id, :start_date, :end_date, presence: true

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest
    .joins(:cat)
    .where("start_date >= ?", start_date)
    .where(cats: { id: cat_id } )
  end
end
