module TestFactories
  def post_without_user(options={})
    post_options = { title: 'Post title', body: 'Post bodies must be pretty long.' }.merge(options)
    post = Post.new(post_options)
    allow(post).to receive(:create_vote)
    post.save
    post
  end

  def authenticated_user
   email = "email#{rand}@fake.com"
   user = User.new(email: email, password: 'password')
   user.skip_confirmation!
   user.save
   user
 end

  def comment_without_user(options={})
    comment_options = {title: 'Comment title', body: 'Comment body'}.merge(options)
    comment = Comment.new(comment_options)
    allow(comment).to receive(:send_favorite_emails)
    comment.save
    comment 
  end
end