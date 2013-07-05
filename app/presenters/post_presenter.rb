class PostPresenter

  def initialize(post)
    @post = post
  end
  def self.method_missing(method, *args, &block)
    @post.send(method, *args, &block)
  end

end