class Ability
  include CanCan::Ability
  def initialize(user)
    
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    
    # Define User abilities
    if user.is? :superadmin
      can :manage, :all
    else
      if user.is? :manager
        can [ :read, :create, :update], :all
      else
         if user.is? :content
           can :manage, [ Admin::Product, Admin::Catalogue]
         else
           if user.is? :sale
             can [ :read, :create, :update], [ Order, OrderDetail]
           end
         end
      end
    end  #end if
    
  end
  
end
