class Note < ApplicationRecord
  include SoftDeletable
  belongs_to :user
  belongs_to :notable, polymorphic: true

  validates_presence_of :subject, :description
end
