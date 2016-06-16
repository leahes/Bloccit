module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end

    def avatar_url(user)
      gravatar_id = Digest::MDS::hexidigest(user.email).downcase "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
  end
end
