class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  
  normalize_blank_values
end
