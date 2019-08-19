class ChangeNum
  def ping_pong
    arr = []
    c=1
    self.times do
      if c%3 == 0
        arr.push('ping')
      elsif c%5 == 0
        arr.push('pong')
      else
        arr.push(c)
      end
      c+=1
    end
    arr
  end
end
