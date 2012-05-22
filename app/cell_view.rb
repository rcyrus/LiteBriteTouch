class CellView < UIView

  def initWithFrame(r)
    @enabled = true
    super(r)
  end

  def set_pos(x,y)
    @x=x
    @y=y
  end

  def set_enabled
    c=UIColor.colorWithRed(0, green:0.81, blue:0.18, alpha:1.0)
    setBackgroundColor(c)
  end

  def set_disabled
    c=UIColor.colorWithRed(0.05, green:0.18, blue:0.09, alpha:1.0)
    setBackgroundColor(c)
  end

  def touchesBegan(touches, withEvent:event)
    if @enabled
      set_disabled ; @enabled = false
    else
      set_enabled ; @enabled = true
    end
  end

end
