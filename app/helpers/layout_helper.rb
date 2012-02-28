# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, header_title = nil)
    content_for(:title) { h(page_title.to_s) }
    content_for(:header_title) { header_title.to_s }
  end

  def show_title?
    content_for? :header_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  # determine class for alert box based on name of flash entry
  def alert_class(name)
    if name == :alert
      "alert-error"
    else #if name == "notice"
      "alert-success"
    end
  end
end
