class BoardController < UIViewController
  def loadView
    self.view = BoardView.alloc.init
    #draw_cells
  end
end
