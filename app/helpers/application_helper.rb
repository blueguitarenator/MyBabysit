# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def top(&block)
    concat content_tag(:div, capture(&block), :class => "top"), block.binding
  end
  
  def middle(&block)
    concat content_tag(:div, capture(&block), :class => "middle"), block.binding
  end
  
  def bottom(&block)
    concat content_tag(:div, capture(&block), :class => "bottom"), block.binding
  end
  
  def limiter(&block)
    concat content_tag(:div, capture(&block), :class => "limiter"), block.binding
  end
  
  def box_first(&block)
    concat content_tag(:div, capture(&block), :class => "box first"), block.binding
  end
  
  def box(&block)
    concat content_tag(:div, capture(&block), :class => "box"), block.binding
  end
  
  def floatL(&block)
    concat content_tag(:div, capture(&block), :class => "floatL"), block.binding
  end
  
  def floatR(&block)
    concat content_tag(:div, capture(&block), :class => "floatR"), block.binding
  end
  
  def footerNavigation(&block)
    concat content_tag(:div, capture(&block), :class => "footerNavigation"), block.binding
  end
  
  def footerInformation(&block)
    concat content_tag(:div, capture(&block), :class => "footerInformation"), block.binding
  end
end
