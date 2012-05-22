class BoardView < UIView
  def initWithFrame(rect)
    if super
      @paths = []
    end
    draw_cells
    self
  end

  def drawRect(rect)
    UIColor.blackColor.set
    UIBezierPath.bezierPathWithRect(rect).fill
    @paths.each do |path, color|
      color.set
      path.stroke
    end
  end

  def touchesBegan(touches, withEvent:event)
    bp = UIBezierPath.alloc.init
    bp.lineWidth = 3.0
    random_color = begin
                     red, green, blue = rand(100)/100.0, 0, rand(100)/100.0
                     UIColor.alloc.initWithRed(red/100.0, green:green, blue:blue, alpha:1.0)
                   end
    @paths << [bp, random_color]
  end

  def touchesMoved(touches, withEvent:event)
    touch = event.touchesForView(self).anyObject
    point = touch.locationInView(self)
    if @previousPoint and !@paths.empty?
      bp = @paths.last.first
      bp.moveToPoint(@previousPoint)
      bp.addLineToPoint(point)
    end
    @previousPoint = point
    setNeedsDisplay
  end

  def touchesEnded(touches, withEvent:event)
    @previousPoint = nil
  end

  def eraseContent
    @paths.clear
    @eraseSound.play
    setNeedsDisplay
  end

  def draw_cells
    cell_height = 15
    cell_width = 12
    @cells = []
    80.times do |i|
      y = 1 + (i * (cell_width + 2))
      12.times do |j|
        x = 1 + (j * (cell_height + 2))
        rect = CGRectMake(x, y, cell_height, cell_width)
        cell = CellView.alloc.initWithFrame(rect)
        cell.set_enabled
        self.addSubview(cell)
        self.sendSubviewToBack(cell)
        @cells << cell
      end
    end
  end
end
