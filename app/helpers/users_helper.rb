module UsersHelper
  def is_are(count)
    if count.abs > 1
      return "are"
    else
      return "is"
    end
  end 
end
