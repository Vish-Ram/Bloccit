class FavoriteMailer < ActionMailer::Base
  default from: "vramamurthy14@sfhs.com"

  def new_comment(user, post, comment)
     headers["Message-ID"] = "<comments/#{comment.id}@vish-bloccit.herokuapp.com>"
     headers["In-Reply-To"] = "<post/#{post.id}@vish-bloccit.herokuapp.com>"
     headers["References"] = "<post/#{post.id}@vish-bloccit.herokuapp.com>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
