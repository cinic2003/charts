module ApplicationHelper
  
  def controller_nav_partial(controller_name)
    begin
      unless controller_name.blank?
        render :partial => "/share/#{controller_name}"
      else
        render :partial => "/share/nav"
      end
    rescue ActionView::MissingTemplate
      render :partial => '/share/nav'
    end
  end
end
