module ApplicationHelper

  def container_css
    return 'col-md-10 col-md-offset-2' unless @home_page
  end
end
