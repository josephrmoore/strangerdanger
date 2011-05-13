module SongHelper
  
  def getAssignmentId(id)
    assigments = Assigment.all
    assigments.each do |assignment|
      if assignment.song_id == id
        return assignment.id
      end
    end
  end
  
end
