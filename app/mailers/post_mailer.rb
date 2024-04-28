# app/mailers/post_mailer.rb
class PostMailer < ApplicationMailer
    default from: 'noreply@example.com'
  
    def new_post(user, post)
      @user = user
      @post = post
      mail(to: @user.email, subject: 'New Post Alert')
    end
  end
  