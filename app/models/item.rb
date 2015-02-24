class Item < ActiveRecord::Base
  belongs_to :list
  #attr_accessor :complete

end
