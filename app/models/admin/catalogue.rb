class Admin::Catalogue < ActiveRecord::Base
  #SEF link
  #def to_param
    #"#{id} #{name}".parameterize
  #end
  #order catalogue list by sort_order
  default_scope{ order('sort_order')}
end
