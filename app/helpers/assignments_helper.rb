module AssignmentsHelper
  def part(id)
    return Part.find(id).name
  end
  
  def song(id)
    return Song.find(id).name
  end
  
  def user(id)
    return User.find(id).username
  end
  
end
