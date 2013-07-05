class PostPresenter < Mustache

  include ActionView::Helpers::DateHelper

  self.template_file = File.join(Rails.root, 'app/views/posts/_post.html.mustache')

  def initialize(post, featured)
    @post = post
    @featured = featured
  end

  def header
    "#{@post.title} - #{@post.source}"
  end

  def featured_class
    "featured" if @featured
  end

  def image_source
    if @featured
      @post.images[:large]
    else
      @post.images[:small]
    end
  end

  def description
    if @featured
      @post.description.truncate(160)
    else
      @post.description.truncate(90)
    end
  end

  def number_of_comments
    @post.comments.length
  end

  def related_posts
    @post.related_posts.map do |post|
      {:title => post.title, :url => post.url, :source => post.source}
    end
  end

  def time_ago
    time_ago_in_words(@post.posted_at)
  end

  def method_missing(method, *args, &block)
    if @post.respond_to?(method)
      @post.send(method, *args, &block)
    else
      super
    end
  end
end