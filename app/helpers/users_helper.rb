module UsersHelper
  
  def checkusers(user)
    if user
      return true
    end
  end
  
  def checkadmin(user)
    if user.has_role?(:admin)
      return true
    end
  end
  
end
