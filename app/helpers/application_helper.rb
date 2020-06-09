module ApplicationHelper
  def active_class controller
    "in" if controller == controller_name
  end
end
