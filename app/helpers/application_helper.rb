module ApplicationHelper
  include Pagy::Frontend

  def page_title
    content_for(:page_title) || Rails.application.class.to_s.split("::").first
  end

  def icon(klass, text = nil)
    icon_tag = tag.i(class: klass)
    text_tag = tag.span text
    text ? tag.span(icon_tag + text_tag) : icon_tag
  end

  def n(number, options = {})
    number_with_precision(number, options)
  end

  def l(object, options = {})
    super(object, options) if object
  end
end
