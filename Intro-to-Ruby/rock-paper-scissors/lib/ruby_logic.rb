class RPS
  def wins?(object, argument)
    #if statements for object being rock
    if object=="rock" && argument=="scissors"
      return true
    elsif object=="rock" && argument=="paper"
      return false
    elsif object=="rock" && argument=="rock"
      return false
      #if statements for object being scissors
    elsif object=="scissors" && argument=="paper"
      return true
    elsif object=="scissors" && argument=="rock"
      return false
    elsif object=="scissors" && argument=="scissors"
      return false
      #if statements for object being paper
    elsif object=="paper" && argument=="rock"
      return true
    elsif object=="paper" && argument=="scissors"
      return false
    elsif object=="paper" && argument=="paper"
      return false
    end
  end
end
