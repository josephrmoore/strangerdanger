module UsersHelper
  def checkadmin(user)
    if user
      if user.has_role?(:admin)
        link_to("Admin Section", admin_path)
      end
    end
  end
end
