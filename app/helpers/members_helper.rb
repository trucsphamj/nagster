module MembersHelper
  def gravatar_for(member, options = { :size => 50 })
    gravatar_image_tag(member.email.downcase, :alt => h(member.name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

end
