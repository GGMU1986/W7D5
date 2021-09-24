class Sub < ApplicationRecord
    validates :title, :moderator_id, presence: true
end