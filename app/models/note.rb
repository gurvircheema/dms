class Note < ApplicationRecord
  belongs_to :user
  belongs_to :notable, polymorphic: true

  validates_presence_of :subject, :description
  default_scope { where(deleted_at: nil) }
end
