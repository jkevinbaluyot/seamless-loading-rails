module ApplicationHelper

  def pageless(total_pages, url=nil, container=nil)
    opts = {
        :totalPages => total_pages,
        :url        => url,
        :loaderMsg  => 'Loading more pages...',
    }

    container && opts[:container] ||= container

    javascript_tag("$('#{container}').pageless(#{opts.to_json});")
  end
end
