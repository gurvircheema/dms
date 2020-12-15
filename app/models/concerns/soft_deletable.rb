module SoftDeletable
  extend ActiveSupport::Concern

  included do
    default_scope { where(deleted_at: nil) }

    def destroy
      update(deleted_at: Time.now)
    end
  end
end
