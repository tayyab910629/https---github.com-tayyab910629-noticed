class NewPostNotifier < Noticed::Event
  deliver_by :action_cable, format: :to_action_cable, channel: "NotificationsChannel" do |notification|
    # Ensure that 'message' is always included in the hash sent to ActionCable
    {
      title: notification.params[:post].title,
      content: notification.params[:post].content,
      message: "New post: #{notification.params[:post].title}"  # Descriptive message
    }
  end

  deliver_by :email, mailer: "PostMailer", method: :new_post
end
