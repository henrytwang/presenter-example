require 'spec_helper'

describe PostPresenter do

  before(:each) do
    @post = mock(Post)
  end

  it "should have a published time" do
    visit posts_path
    page.should have_content 'published about'
  end

end