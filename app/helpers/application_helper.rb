module ApplicationHelper

  def container_css
    if @home_page
      'col-sm-9 col-sm-offset-3 main'
    else
      'col-sm-9 main'
    end
  end
end
