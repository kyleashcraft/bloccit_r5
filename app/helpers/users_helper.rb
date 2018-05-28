module UsersHelper
  def is_are(count) #returns if or are based on plurality of passed object
    if count.abs > 1
      return "are"
    else
      return "is"
    end
  end

  def partial_password(str) #returns partially hidden password for confirmation page
    newstr = str.dup #duplicate, not pointing to same str value
    if newstr
      for i in 0...str.length
        newstr[i] = "*" if (i != 0 && i != newstr.length - 1)
      end
      return newstr
    else
      return 'NO PASSWORD'
    end
  end
end
