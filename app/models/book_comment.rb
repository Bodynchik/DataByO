class BookComment < ApplicationRecord
  belongs_to :book
  belongs_to :client
end
