class User < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :schedule_memo, presence: true

  validate :date_before_start

  def date_before_start
    return if end_date.blank?
    errors.add(:end_date, "は今日以降の日付で選択してください") if end_date < Date.today
  end




end
