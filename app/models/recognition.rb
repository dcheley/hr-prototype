class Recognition < ApplicationRecord
  belongs_to :receiver, class_name: :User
  belongs_to :recognizer, class_name: :User
end
