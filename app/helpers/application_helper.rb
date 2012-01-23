module ApplicationHelper

  def is_controller_active?(controller)
    if controller.include?(params[:controller])
      {:class => "active"}
    end
  end

end
