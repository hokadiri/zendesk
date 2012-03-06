#! /usr/bin/env ruby
class Blog < Object
  def initialize(options = {})
    @header = options[:header]
    @footer = options[:bottom]
    @posts = options[:posts]
  end
 
  def htmlDiv(content)
    return "<div>" + content + "</div>"
  end

  def htmlH1(content)
    return "<h1>" + content + "</h1>"
  end


  def render
    output = [htmlDiv(htmlH1 @header)]
    puts htmlDiv(htmlH1 @header)
    for p in @posts.sort{|a,b| a[:created_at].to_i <=> b[:created_at].to_i }
      output.push(render_post(p))
      output.push(render_comments(p))
    end
    output.push(htmlDiv(@footer))
  end

  def renderer(post)
     return "<p>#{post[:title].upcase}</p>"
  end

  def render_post(current_post)
    begin
      htmlDiv(renderer(current_post))
    rescue
      []
    end
  end

  def render_comments(current_post)
    current_post[:comments].each{|c| htmlDiv(c)}
  end

end

require 'date'
posts = [
    { :title => "I like Zendesk", :comments => ["Dogs are awesome"],
      :created_at => Time.now },
    { :title => "I like Bananas", :comments => ["Typos are awesome"],
      :created_at => Time.now },
    { :title => nil, :comments => ["wibbles are wobble", "yay"],
      :created_at => Time.now }
]

blog = Blog.new(:posts => posts, :header => "my blog", :bottom =>
                "Copyright Wobble (2012)")

puts blog.render
