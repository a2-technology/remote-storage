class Upload < ApplicationRecord
  belongs_to :user

  has_rich_text :content

  validates :content, presence: true
  validates :user_id, presence: true

  scope :sorted, -> { order(arel_table[:pubished_at].desc.nulls_last).order(updated_at: :desc) }
  scope :placeholder, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def placeholder?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def published?
    published_at? && published_at > Time.current
  end
end
