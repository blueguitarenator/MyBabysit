# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def top(&block)
    concat(content_tag(:div, capture(&block), :class => "top"))
  end
  
  def middle(&block)
    concat(content_tag(:div, capture(&block), :class => "middle"))
  end
  
  def bottom(&block)
    concat(content_tag(:div, capture(&block), :class => "bottom"))
  end
  
  def limiter(&block)
    concat(content_tag(:div, capture(&block), :class => "limiter"))
  end
  
  def box_first(&block)
    concat(content_tag(:div, capture(&block), :class => "box first"))
  end
  
  def box(&block)
    concat(content_tag(:div, capture(&block), :class => "box"))
  end
  
  def floatL(&block)
    concat(content_tag(:div, capture(&block), :class => "floatL"))
  end
  
  def floatR(&block)
    concat(content_tag(:div, capture(&block), :class => "floatR"))
  end
  
  def footerNavigation(&block)
    concat(content_tag(:div, capture(&block), :class => "footerNavigation"))
  end
  
  def footerInformation(&block)
    concat(content_tag(:div, capture(&block), :class => "footerInformation"))
  end
end
