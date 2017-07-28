module ApplicationHelper
  def_profile_image(user)
    unless  user.provider.blank?
      image_url = user.image_url
    else
      image_url = 'no_image.png'
    end
    image_tag(image_url,alt:user.name)
  end
end
