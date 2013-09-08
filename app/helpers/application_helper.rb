# -*- encoding: utf-8 -*-

module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    sort_params = {:sort => column, :direction => direction}
    link_to title, params.merge(sort_params), {:class => css_class}
  end

  def referrerless_link_to(title, url)
    referrerless_url = "http://nullrefer.com/?#{url}"
    link_to "➜ #{title}", referrerless_url
  end

  def edit_button(object, style = "")
    link_to I18n.t('.edit', :default => t("helpers.links.edit")),
      edit_polymorphic_path(object),
      :class => "btn #{style}"
  end

  def delete_button(object, style = "")
    link_to I18n.t('.destroy', :default => t("helpers.links.destroy")),
      polymorphic_path(object),
      :method => :delete,
      :data => { :confirm => I18n.t('.confirm', :default => 'Are you sure you want to delete?') },
      :class => "btn #{style} btn-danger"
  end

end
