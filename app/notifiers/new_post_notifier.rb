# # To deliver this notification:
# #
# # NewPostNotifier.with(record: @post, message: "New post").deliver(User.all)

# class NewPostNotifier < ApplicationNotifier
#   # Add your delivery methods
#   #
#   # deliver_by :email do |config|
#   #   config.mailer = "UserMailer"
#   #   config.method = "new_post"
#   # end
#   #
#   # bulk_deliver_by :slack do |config|
#   #   config.url = -> { Rails.application.credentials.slack_webhook_url }
#   # end
#   #
#   # deliver_by :custom do |config|
#   #   config.class = "MyDeliveryMethod"
#   # end

#   # Add required params
#   #
#   # required_param :message
# end


# app/notifiers/new_post_notifier.rb
# app/notifiers/new_post_notifier.rb
# app/notifiers/new_post_notifier.rb
# app/notifiers/new_post_notifier.rb
# app/notifiers/new_post_notifier.rb
# app/notifiers/new_post_notifier.rb
# app/notifiers/new_post_notifier.rb
# app/notifiers/new_post_notifier.rb
# app/notifiers/new_post_notifier.rb
class NewPostNotifier < Noticed::Event
  deliver_by :database
  param :post_id

  deliver_by :action_cable, format: :to_action_cable, channel: "NotificationsChannel" do |notification|
    Rails.logger.info "Notification Params: #{notification.params.inspect}"
    post = Post.find_by(id: notification.params[:post_id])

    if post
      {
        title: post.title,
        message: "New post created: #{post.title}",
        content: post.content,
        url: Rails.application.routes.url_helpers.post_path(post)
      }
    else
      Rails.logger.error "Post not found for ID: #{notification.params[:post_id]}"
      {}
    end
  end
end








